import { Wrench } from 'lucide-react';
import { useNavigate } from 'react-router-dom';

export default function Footer() {
  const navigate = useNavigate();
  const currentYear = new Date().getFullYear();

  return (
    <footer className="bg-white border-t border-gray-200 mt-12">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
          {/* Branding */}
          <div className="flex items-center gap-3">
            <div className="w-8 h-8 bg-gradient-to-br from-blue-600 to-indigo-600 rounded-lg flex items-center justify-center">
              <Wrench className="w-5 h-5 text-white" />
            </div>
            <div>
              <h3 className="text-lg font-bold text-gray-900">
                ValveSpecs <span className="text-blue-600">Pro</span>
              </h3>
              <p className="text-xs text-gray-500">Global Valve Specifications Database</p>
            </div>
          </div>

          {/* Navigation */}
          <div className="flex flex-wrap items-center gap-4 text-sm text-gray-600">
            <button onClick={() => navigate('/')} className="hover:text-blue-600 cursor-pointer">Home</button>
            <span className="text-gray-300">|</span>
            <button onClick={() => navigate('/brands')} className="hover:text-blue-600 cursor-pointer">Brands</button>
            <span className="text-gray-300">|</span>
            <button onClick={() => navigate('/blog')} className="hover:text-blue-600 cursor-pointer">Blog</button>
            <span className="text-gray-300">|</span>
            <a href="/privacy" className="hover:text-blue-600">Privacy Policy</a>
            <span className="text-gray-300">|</span>
            <a href="/terms" className="hover:text-blue-600">Terms of Service</a>
            <span className="text-gray-300">|</span>
            <a href="/about" className="hover:text-blue-600">About</a>
            <span className="text-gray-300">|</span>
            <a href="mailto:nnzenw@126.com" className="hover:text-blue-600">Support: nnzenw@126.com</a>
          </div>

          {/* Copyright */}
          <div className="text-xs text-gray-400">
            © {currentYear} ValveSpecs Pro. All rights reserved.
          </div>
        </div>
      </div>
    </footer>
  );
}