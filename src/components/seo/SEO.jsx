import { Helmet } from 'react-helmet-async';

export default function SEO({ 
  title, 
  description, 
  canonical, 
  ogImage = '/og-default.png', 
  schemaData,
  breadcrumb 
}) {
  const siteName = 'ValveSpecs Pro';
  const fullTitle = title ? `${title} | ${siteName}` : siteName;

  return (
    <Helmet>
      <title>{fullTitle}</title>
      {description && <meta name="description" content={description} />}
      {canonical && <link rel="canonical" href={canonical} />}
      
      {/* Open Graph - Specialized for B2B Technical Content */}
      <meta property="og:type" content={schemaData?.["@type"] === 'Product' ? 'product' : 'article'} />
      <meta property="og:title" content={fullTitle} />
      {description && <meta property="og:description" content={description} />}
      <meta property="og:image" content={ogImage} />
      <meta property="og:site_name" content={siteName} />
      <meta property="og:locale" content="en_US" />
      
      {/* Twitter Card */}
      <meta name="twitter:card" content="summary_large_image" />
      <meta name="twitter:title" content={fullTitle} />
      {description && <meta name="twitter:description" content={description} />}
      
      {/* Schema.org JSON-LD - Support multiple schemas */}
      {schemaData && Array.isArray(schemaData) ? (
        schemaData.map((data, index) => (
          <script key={index} type="application/ld+json">
            {JSON.stringify(data)}
          </script>
        ))
      ) : schemaData && (
        <script type="application/ld+json">
          {JSON.stringify(schemaData)}
        </script>
      )}
      
      {breadcrumb && breadcrumb.length > 0 && (
        <script type="application/ld+json">
          {JSON.stringify({
            "@context": "https://schema.org",
            "@type": "BreadcrumbList",
            "itemListElement": breadcrumb.map((item, index) => ({
              "@type": "ListItem",
              "position": index + 1,
              "name": item.name,
              "item": item.url
            }))
          })}
        </script>
      )}
    </Helmet>
  )
}