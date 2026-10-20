import 'package:flutter/material.dart';

/// Konfigurasi denah satu bagian area parkir.
class _SectionLayout {
  final String name;

  /// Jumlah slot per kelompok kolom, misal [1, 2, 2].
  final List<int> groups;

  /// Jumlah baris (A1..An).
  final int rows;

  /// Jumlah slot di baris bawah (B1..Bn).
  final int bottomSlots;

  /// ID slot yang terisi. Format: 'A{baris}-{kolom}' dan 'B{nomor}'.
  final Set<String> occupied;

  const _SectionLayout({
    required this.name,
    required this.groups,
    required this.rows,
    required this.bottomSlots,
    required this.occupied,
  });

  int get totalSlots =>
      rows * groups.fold<int>(0, (a, b) => a + b) + bottomSlots;

  int get emptySlots => totalSlots - occupied.length;
}

const _sections = <_SectionLayout>[
  _SectionLayout(
    name: 'Samping gedung E',
    groups: [1, 2, 2],
    rows: 10,
    bottomSlots: 4,
    occupied: {
      'A1-1', 'A1-2', 'A1-3', 'A1-4',
      'A2-2', 'A2-4', 'A2-5',
      'A3-1', 'A3-2', 'A3-3', 'A3-4', 'A3-5',
      'A4-1', 'A4-2', 'A4-3', 'A4-4', 'A4-5',
      'A5-1', 'A5-2', 'A5-3', 'A5-4', 'A5-5',
      'A6-2', 'A6-3', 'A6-5',
      'A7-1', 'A7-2', 'A7-3', 'A7-4', 'A7-5',
      'A8-1', 'A8-2', 'A8-3', 'A8-4', 'A8-5',
      'A9-1', 'A9-2', 'A9-3', 'A9-4', 'A9-5',
      'A10-1', 'A10-2', 'A10-3', 'A10-4', 'A10-5',
      'B1', 'B3', 'B4',
    },
  ),
  _SectionLayout(
    name: 'Samping taman EduTech',
    groups: [2, 2],
    rows: 8,
    bottomSlots: 3,
    occupied: {
      'A1-1', 'A1-2', 'A1-4',
      'A2-1', 'A2-3', 'A2-4',
      'A3-2', 'A3-3',
      'A4-1', 'A4-2', 'A4-3', 'A4-4',
      'A5-3',
      'A6-1', 'A6-2', 'A6-4',
      'A7-2', 'A7-3', 'A7-4',
      'B2',
    },
  ),
];

class ParkingPage extends StatefulWidget {
  final String areaName;

  const ParkingPage({super.key, this.areaName = 'EduTech'});

  @override
  State<ParkingPage> createState() => _ParkingPageState();
}

class _ParkingPageState extends State<ParkingPage> {
  static const Color _primary = Color(0xFF5142FF);
  static const Color _ink = Color(0xFF19172E);
  static const Color _muted = Color(0xFF8A87A6);
  static const Color _bg = Color(0xFFF7F6FF);

  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final section = _sections[_selected];

    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tombol kembali
              InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: _softShadow,
                        ),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          size: 20,
                          color: _ink,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Kembali',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: _ink,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Judul
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                    letterSpacing: -0.5,
                    color: _ink,
                  ),
                  children: [
                    const TextSpan(text: 'Denah Area Parkir\n'),
                    TextSpan(
                      text: widget.areaName,
                      style: const TextStyle(color: _primary),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // Dropdown pilih bagian
              const Text(
                'Pilih bagian',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: _ink,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: _softShadow,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    value: _selected,
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(16),
                    dropdownColor: Colors.white,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: _primary,
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _ink,
                    ),
                    items: [
                      for (var i = 0; i < _sections.length; i++)
                        DropdownMenuItem(
                          value: i,
                          child: Text(_sections[i].name),
                        ),
                    ],
                    onChanged: (v) {
                      if (v != null) setState(() => _selected = v);
                    },
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Ringkasan ketersediaan
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0x1F5142FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.local_parking_rounded,
                          size: 16,
                          color: _primary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${section.emptySlots} kosong dari ${section.totalSlots} slot',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: _primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Denah
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: _ParkingGrid(
                  key: ValueKey(_selected),
                  section: section,
                ),
              ),

              const SizedBox(height: 22),

              // Keterangan
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: _softShadow,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Keterangan',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: _ink,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        _LegendItem(filled: false, label: 'Kosong'),
                        SizedBox(width: 28),
                        _LegendItem(filled: true, label: 'Terisi'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const List<BoxShadow> _softShadow = [
  BoxShadow(
    color: Color(0x145142FF),
    blurRadius: 18,
    offset: Offset(0, 6),
  ),
];

const Color _slotEmpty = Color(0xFFE4E1FF);
const Color _slotFilled = Color(0xFF5142FF);

class _ParkingGrid extends StatelessWidget {
  final _SectionLayout section;

  const _ParkingGrid({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    var colOffset = 0;
    final groupOffsets = <int>[];
    for (final g in section.groups) {
      groupOffsets.add(colOffset);
      colOffset += g;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 16, 16, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: _softShadow,
      ),
      child: Column(
        children: [
          // Baris A
          for (var r = 1; r <= section.rows; r++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  SizedBox(
                    width: 34,
                    child: Text(
                      'A$r',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF19172E),
                      ),
                    ),
                  ),
                  for (var g = 0; g < section.groups.length; g++) ...[
                    if (g > 0) const SizedBox(width: 14),
                    Expanded(
                      flex: section.groups[g],
                      child: Row(
                        children: [
                          for (var c = 1; c <= section.groups[g]; c++)
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                ),
                                child: _Slot(
                                  filled: section.occupied.contains(
                                    'A$r-${groupOffsets[g] + c}',
                                  ),
                                  height: 20,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),

          const SizedBox(height: 10),
          Container(height: 1, color: const Color(0x1F5142FF)),
          const SizedBox(height: 12),

          // Baris B
          Row(
            children: [
              const SizedBox(width: 34),
              for (var b = 1; b <= section.bottomSlots; b++)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      _Slot(
                        filled: section.occupied.contains('B$b'),
                        width: 24,
                        height: 36,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'B$b',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF19172E),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Slot extends StatelessWidget {
  final bool filled;
  final double? width;
  final double height;

  const _Slot({required this.filled, this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: filled ? _slotFilled : _slotEmpty,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final bool filled;
  final String label;

  const _LegendItem({required this.filled, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 16,
          decoration: BoxDecoration(
            color: filled ? _slotFilled : _slotEmpty,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF19172E),
          ),
        ),
      ],
    );
  }
}