<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kalkulator Pajak Air Tanah (PAT) Bapenda Kota Padang</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        body { font-family: 'Inter', sans-serif; }
    </style>
</head>
<body class="bg-slate-100 text-slate-800 min-h-screen flex flex-col justify-between">

    <!-- Header / Navbar -->
    <header class="bg-blue-900 text-white shadow-md">
        <div class="max-w-5xl mx-auto px-4 py-4 flex flex-col sm:flex-row justify-between items-center">
            <div class="flex items-center space-x-3">
                <div class="bg-blue-700 p-2.5 rounded-lg text-white">
                    <i class="fa-solid fa-calculator text-xl"></i>
                </div>
                <div>
                    <h1 class="text-lg font-bold tracking-tight">Kalkulator Pajak Air Tanah (PAT) Bapenda Kota Padang</h1>
                    <p class="text-xs text-blue-200">Perhitungan Progresif Nilai Perolehan Air (NPA)</p>
                </div>
            </div>
            <div class="mt-3 sm:mt-0 text-xs bg-blue-800 px-3 py-1.5 rounded-full text-blue-200 border border-blue-700">
                <i class="fa-solid fa-shield-halved mr-1"></i> Tarif Pajak: 10%
            </div>
        </div>
    </header>

    <!-- Main Container -->
    <main class="max-w-5xl mx-auto px-4 py-8 w-full flex-grow">
        
        <!-- Form Input Card -->
        <div class="bg-white rounded-xl shadow-sm border border-slate-200 p-6 mb-8">
            <div class="flex items-center space-x-2 mb-5 pb-3 border-b border-slate-100">
                <i class="fa-solid fa-pen-to-square text-blue-800"></i>
                <h2 class="font-semibold text-slate-800 text-base">Input Data Wajib Pajak & Pengambilan Air</h2>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Kelompok -->
                <div>
                    <label class="block text-xs font-semibold text-slate-600 uppercase tracking-wider mb-2">
                        1. Pilih Kelompok Wajib Pajak
                    </label>
                    <select id="kelompokSelect" onchange="updateJenisUsahaOptions()" class="w-full bg-slate-50 border border-slate-300 rounded-lg px-4 py-2.5 text-sm font-medium text-slate-800 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:bg-white transition">
                        <option value="" disabled selected>-- Pilih Kelompok Wajib Pajak --</option>
                        <option value="Kelompok 1">Kelompok 1</option>
                        <option value="Kelompok 2">Kelompok 2</option>
                        <option value="Kelompok 3">Kelompok 3</option>
                        <option value="Kelompok 4">Kelompok 4</option>
                        <option value="Kelompok 5">Kelompok 5</option>
                    </select>
                </div>

                <!-- Jenis Usaha -->
                <div>
                    <label class="block text-xs font-semibold text-slate-600 uppercase tracking-wider mb-2">
                        2. Pilih Jenis Usaha / Peruntukan
                    </label>
                    <select id="jenisUsahaSelect" onchange="hitungPajak()" class="w-full bg-slate-50 border border-slate-300 rounded-lg px-4 py-2.5 text-sm font-medium text-slate-800 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:bg-white transition">
                        <option value="" disabled selected>-- Pilih Jenis Usaha --</option>
                    </select>
                </div>

                <!-- Nama Wajib Pajak -->
                <div>
                    <label class="block text-xs font-semibold text-slate-600 uppercase tracking-wider mb-2">
                        3. Nama Wajib Pajak / Perusahaan
                    </label>
                    <input type="text" id="namaWp" placeholder="Contoh: PT. Sumber Tirta Mandiri" value="" oninput="hitungPajak()" class="w-full bg-slate-50 border border-slate-300 rounded-lg px-4 py-2.5 text-sm font-medium text-slate-800 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:bg-white transition">
                </div>

                <!-- Volume Pengambilan Air -->
                <div>
                    <label class="block text-xs font-semibold text-slate-600 uppercase tracking-wider mb-2">
                        4. Volume Pengambilan Air (m³)
                    </label>
                    <div class="relative">
                        <input type="number" id="volumeInput" value="" min="0" placeholder="0" oninput="hitungPajak()" class="w-full bg-yellow-50 border border-yellow-300 rounded-lg px-4 py-2.5 text-sm font-bold text-blue-900 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:bg-white transition">
                        <div class="absolute inset-y-0 right-0 pr-4 flex items-center pointer-events-none text-xs font-semibold text-slate-500">
                            m³ / bulan
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Result Card / Printable Report Section -->
        <div id="printArea" class="bg-white rounded-xl shadow-sm border border-slate-200 p-6 sm:p-8">
            
            <!-- Report Header -->
            <div class="text-center pb-6 mb-6 border-b border-slate-200">
                <h2 class="text-xl font-bold text-blue-900 uppercase tracking-wide">LEMBAR HASIL PERHITUNGAN PAJAK AIR TANAH (PAT)<br><span class="text-lg font-semibold text-blue-800">BAPENDA KOTA PADANG</span></h2>
                <p class="text-xs text-slate-500 mt-1">Berdasarkan Nilai Perolehan Air (NPA) Berjenjang Progresif</p>
            </div>

            <!-- Meta Info Summary -->
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-6 bg-slate-50 p-4 rounded-lg border border-slate-200 text-sm">
                <div>
                    <span class="text-slate-500 block text-xs">Wajib Pajak:</span>
                    <span id="resNamaWp" class="font-bold text-slate-800 text-base">-</span>
                </div>
                <div>
                    <span class="text-slate-500 block text-xs">Kelompok & Jenis Usaha:</span>
                    <span id="resInfoUsaha" class="font-semibold text-blue-900">-</span>
                </div>
                <div>
                    <span class="text-slate-500 block text-xs">Total Volume Pengambilan:</span>
                    <span id="resTotalVol" class="font-bold text-slate-800">0 m³</span>
                </div>
                <div>
                    <span class="text-slate-500 block text-xs">Tarif Pajak Air Tanah:</span>
                    <span class="font-bold text-slate-800">10%</span>
                </div>
            </div>

            <!-- Calculation Table -->
            <div class="overflow-x-auto mb-6">
                <table class="w-full text-left border-collapse">
                    <thead>
                        <tr class="bg-blue-900 text-white text-xs uppercase tracking-wider">
                            <th class="py-3 px-4 text-center rounded-l-lg">No</th>
                            <th class="py-3 px-4">Tier Volume (m³)</th>
                            <th class="py-3 px-4 text-right">Volume Terhitung (m³)</th>
                            <th class="py-3 px-4 text-right">NPA (Rp/m³)</th>
                            <th class="py-3 px-4 text-right rounded-r-lg">NPA Kena Pajak (Rp)</th>
                        </tr>
                    </thead>
                    <tbody id="tableBody" class="text-sm divide-y divide-slate-100">
                        <!-- Populated by JS -->
                    </tbody>
                    <tfoot>
                        <tr class="bg-slate-50 font-bold border-t border-slate-200">
                            <td colspan="2" class="py-3 px-4 text-right">Total Volume / Total NPA:</td>
                            <td id="sumVol" class="py-3 px-4 text-right">0</td>
                            <td class="py-3 px-4"></td>
                            <td id="sumNpa" class="py-3 px-4 text-right text-blue-900">Rp 0</td>
                        </tr>
                        <tr class="bg-slate-50 font-bold">
                            <td colspan="4" class="py-3 px-4 text-right">Tarif Pajak Air Tanah:</td>
                            <td class="py-3 px-4 text-right">10%</td>
                        </tr>
                    </tfoot>
                </table>
            </div>

            <!-- Grand Total Highlight Box -->
            <div class="bg-gradient-to-r from-blue-900 to-blue-800 text-white rounded-xl p-6 flex flex-col sm:flex-row justify-between items-center shadow-md">
                <div class="mb-3 sm:mb-0 text-center sm:text-left">
                    <span class="text-xs uppercase tracking-wider text-blue-200 font-semibold block">Total Pajak Air Tanah Terutang</span>
                    <span class="text-xs text-blue-300">(Total NPA Kena Pajak × Tarif 10%)</span>
                </div>
                <div id="grandTotal" class="text-2xl sm:text-3xl font-extrabold text-yellow-300">
                    Rp 0
                </div>
            </div>

            <!-- Timestamp footer for report -->
            <div class="mt-8 pt-4 border-t border-slate-100 text-right text-xs text-slate-400 hidden print:block">
                Dicetak otomatis melalui Aplikasi Kalkulator Pajak Air Tanah Bapenda Kota Padang pada <span id="printDate"></span>
            </div>

        </div>

        <!-- Action Buttons -->
        <div class="mt-6 flex flex-col sm:flex-row justify-end gap-3">
            <button onclick="resetKalkulator()" class="bg-white hover:bg-slate-50 text-red-600 border border-slate-300 font-medium px-5 py-2.5 rounded-lg text-sm transition flex items-center justify-center space-x-2 shadow-sm cursor-pointer">
                <i class="fa-solid fa-rotate-left"></i>
                <span>Reset</span>
            </button>
        </div>

    </main>

    <!-- Footer -->
    <footer class="bg-white border-t border-slate-200 py-4 text-center text-xs text-slate-500 mt-12">
        &copy; 2026 Kalkulator Pajak Air Tanah (PAT) Bapenda Kota Padang • Dirancang oleh David Caesar, SH, MM
    </footer>

    <!-- JavaScript Logic -->
    <script>
        const masterUsaha = {
            "Kelompok 1": [
                "pemasok air baku",
                "perusahaan air minum",
                "industri air minum dalam kemasan",
                "pabrik es kristal",
                "pabrik minuman olahan"
            ],
            "Kelompok 2": [
                "industri tekstil",
                "pabrik makanan olahan",
                "hotel bintang 3",
                "hotel bintang 4",
                "hotel bintang 5",
                "pabrik kimia",
                "pengolahan bubur beton (ready mix)",
                "mall",
                "supermarket",
                "mini market",
                "swalayan",
                "tempat pemotongan hewan"
            ],
            "Kelompok 3": [
                "hotel bintang 1",
                "hotel bintang 2",
                "usaha penyewaan jasa kantor",
                "apartemen",
                "pabrik es skala kecil",
                "agro industri",
                "peternakan non rakyat",
                "pemandian (water boom)",
                "industri pengolahan logam",
                "perbankan",
                "dealer alat berat/mobil/motor",
                "bengkel/service",
                "universitas",
                "sekolah",
                "lembaga pendidikan",
                "gedung pertemuan",
                "laundry",
                "pabrik pengolahan karet"
            ],
            "Kelompok 4": [
                "losmen",
                "pondokan",
                "penginapan",
                "rumah sewa/ kost",
                "tempat hiburan",
                "restoran",
                "kafe",
                "gudang pendingin",
                "pabrik mesin pendingin",
                "pencucian kendaraan bermotor",
                "perkantoran",
                "perusahaan",
                "salon",
                "panti pijat",
                "panti reflexi",
                "barbershop",
                "gudang",
                "spbu"
            ],
            "Kelompok 5": [
                "usaha kecil rumah tangga",
                "hotel non bintang",
                "rumah makan",
                "rumah sakit",
                "klinik",
                "balai pengobatan",
                "praktek dokter",
                "praktek bidan",
                "laboratorium"
            ]
        };

        const masterTarif = {
            "Kelompok 1": [26662, 30298, 35751, 43936, 56200],
            "Kelompok 2": [25046, 27874, 32116, 38482, 48024],
            "Kelompok 3": [23430, 25450, 28480, 33029, 39839],
            "Kelompok 4": [21814, 23026, 24844, 27575, 31663],
            "Kelompok 5": [20198, 20602, 21208, 22121, 23479]
        };

        const tierLabels = [
            "0 s.d. 50",
            "51 s.d. 500",
            "501 s.d. 1.000",
            "1001 s.d. 2.500",
            "Lebih dari 2.500"
        ];

        function updateJenisUsahaOptions() {
            const kelompok = document.getElementById('kelompokSelect').value;
            const jenisSelect = document.getElementById('jenisUsahaSelect');
            jenisSelect.innerHTML = '<option value="" disabled selected>-- Pilih Jenis Usaha --</option>';
            
            const listUsaha = masterUsaha[kelompok] || [];
            listUsaha.forEach(usaha => {
                const opt = document.createElement('option');
                opt.value = usaha;
                opt.textContent = usaha;
                jenisSelect.appendChild(opt);
            });
            
            hitungPajak();
        }

        function formatRupiah(angka) {
            return 'Rp ' + Math.round(angka).toLocaleString('id-ID');
        }

        function resetKalkulator() {
            document.getElementById('kelompokSelect').selectedIndex = 0;
            document.getElementById('jenisUsahaSelect').innerHTML = '<option value="" disabled selected>-- Pilih Jenis Usaha --</option>';
            document.getElementById('namaWp').value = '';
            document.getElementById('volumeInput').value = '';
            hitungPajak();
        }

        function hitungPajak() {
            const kelompok = document.getElementById('kelompokSelect').value;
            const jenisUsaha = document.getElementById('jenisUsahaSelect').value;
            const namaWp = document.getElementById('namaWp').value || '-';
            const totalVol = parseFloat(document.getElementById('volumeInput').value) || 0;

            document.getElementById('resNamaWp').textContent = namaWp;
            document.getElementById('resInfoUsaha').textContent = (kelompok && jenisUsaha) ? `${kelompok} - ${jenisUsaha}` : '-';
            document.getElementById('resTotalVol').textContent = totalVol.toLocaleString('id-ID') + ' m³';

            let tbodyHtml = '';
            let totalNpaKenaPajak = 0;
            let totalVolumeTerhitung = 0;

            if (!kelompok || !masterTarif[kelompok]) {
                for (let i = 0; i < 5; i++) {
                    tbodyHtml += `
                        <tr class="hover:bg-slate-50 transition">
                            <td class="py-3 px-4 text-center font-medium text-slate-600">${i + 1}</td>
                            <td class="py-3 px-4 text-slate-800 font-medium">${tierLabels[i]}</td>
                            <td class="py-3 px-4 text-right font-semibold text-slate-700">0</td>
                            <td class="py-3 px-4 text-right text-slate-600">Rp 0</td>
                            <td class="py-3 px-4 text-right font-bold text-slate-800">Rp 0</td>
                        </tr>
                    `;
                }
            } else {
                const v1 = Math.min(50, totalVol);
                const v2 = Math.min(450, Math.max(0, totalVol - 50));
                const v3 = Math.min(500, Math.max(0, totalVol - 500));
                const v4 = Math.min(1500, Math.max(0, totalVol - 1000));
                const v5 = Math.max(0, totalVol - 2500);

                const volumes = [v1, v2, v3, v4, v5];
                const tarifs = masterTarif[kelompok];

                for (let i = 0; i < 5; i++) {
                    const vol = volumes[i];
                    const tarif = tarifs[i];
                    const npaPajak = vol * tarif;

                    totalNpaKenaPajak += npaPajak;
                    totalVolumeTerhitung += vol;

                    tbodyHtml += `
                        <tr class="hover:bg-slate-50 transition">
                            <td class="py-3 px-4 text-center font-medium text-slate-600">${i + 1}</td>
                            <td class="py-3 px-4 text-slate-800 font-medium">${tierLabels[i]}</td>
                            <td class="py-3 px-4 text-right font-semibold text-slate-700">${vol.toLocaleString('id-ID')}</td>
                            <td class="py-3 px-4 text-right text-slate-600">${formatRupiah(tarif)}</td>
                            <td class="py-3 px-4 text-right font-bold text-slate-800">${formatRupiah(npaPajak)}</td>
                        </tr>
                    `;
                }
            }

            document.getElementById('tableBody').innerHTML = tbodyHtml;
            document.getElementById('sumVol').textContent = totalVolumeTerhitung.toLocaleString('id-ID');
            document.getElementById('sumNpa').textContent = formatRupiah(totalNpaKenaPajak);

            const pajakTerutang = totalNpaKenaPajak * 0.10;
            document.getElementById('grandTotal').textContent = formatRupiah(pajakTerutang);
            
            const now = new Date();
            document.getElementById('printDate').textContent = now.toLocaleDateString('id-ID', { day: 'numeric', month: 'long', year: 'numeric' });
        }

        window.onload = function() {
            updateJenisUsahaOptions();
        };
    </script>
</body>
</html>
