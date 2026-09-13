import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';

class FaceScanScreen extends StatefulWidget {
  const FaceScanScreen({super.key});

  @override
  State<FaceScanScreen> createState() => _FaceScanScreenState();
}

class _FaceScanScreenState extends State<FaceScanScreen> {
  bool _scanning = true;
  bool _success = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _scanning = false;
        _success = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.face, color: AppColors.primaryLight),
                  const SizedBox(width: 8),
                  Text(
                    'FUTURE FACE',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '09:07 AM',
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.person,
                        size: 200,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _success
                            ? AppColors.success
                            : AppColors.primaryLight,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  if (_scanning)
                    Positioned(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Scanning...',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const CircularProgressIndicator(
                            color: AppColors.primaryLight,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            if (_success)
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.success,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.check_circle,
                            color: Colors.white, size: 32),
                        const SizedBox(width: 12),
                        Text(
                          'Scan Successful',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.white38, height: 25),
                    _buildInfoRow('Name', 'Aamir Kumar'),
                    _buildInfoRow('Employee ID', '0WE59E7'),
                    _buildInfoRow('Role', 'Senior Engineer'),
                    _buildInfoRow('Access Level', 'Standard'),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'SMART • SECURE • TOGETHER',
                style: GoogleFonts.poppins(
                  color: Colors.white54,
                  fontSize: 11,
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 13,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
