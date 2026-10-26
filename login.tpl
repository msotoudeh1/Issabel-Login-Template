<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Issabel Admin" />
	<meta name="theme-color" content="#f8fafc" />

	<title>365voip - {$PAGE_NAME}</title>

	<!-- فونت وزیرمتن -->
	<link rel="stylesheet" href="Vazirmatn-font-face.css">

	<!-- Tailwind CSS -->
	<script src="3.4.17.js"></script>

	{literal}
	<style>
		/* ============================================================
		   پایه و فونت
		   ============================================================ */
		*, *::before, *::after { box-sizing: border-box; }

		html, body { height: 100%; }

		html { font-family: 'Vazirmatn', system-ui, -apple-system, 'Segoe UI', Tahoma, sans-serif; }

		body, input, button, textarea, select {
			font-family: 'Vazirmatn', system-ui, -apple-system, 'Segoe UI', Tahoma, sans-serif !important;
		}

		body.login-page {
			min-height: 100vh;
			min-height: 100dvh;
			background:
				radial-gradient(1100px 700px at 85% -10%, #e0e7ff 0%, transparent 60%),
				radial-gradient(900px 600px at 5% 110%, #cffafe 0%, transparent 60%),
				linear-gradient(180deg, #f8fafc 0%, #f1f5f9 100%);
			-webkit-font-smoothing: antialiased;
			position: relative;
			overflow-x: hidden;
		}

		/* الگوی نقطه‌ای ظریف پس‌زمینه */
		body.login-page::before {
			content: '';
			position: fixed;
			inset: 0;
			background-image: radial-gradient(rgba(99, 102, 241, .10) 1px, transparent 1px);
			background-size: 22px 22px;
			mask-image: radial-gradient(circle at 50% 40%, #000 0%, transparent 75%);
			-webkit-mask-image: radial-gradient(circle at 50% 40%, #000 0%, transparent 75%);
			pointer-events: none;
			z-index: 0;
		}

		/* ============================================================
		   Bento Grid
		   ============================================================ */
		.bento-grid {
			display: grid;
			grid-template-columns: repeat(2, minmax(0, 1fr));
			gap: 12px;
		}

		.bento-cell {
			background: #ffffff;
			border: 1px solid rgba(15, 23, 42, .07);
			border-radius: 22px;
			position: relative;
			overflow: hidden;
		}

		.bento-cell--full { grid-column: 1 / -1; }

		.bento-cell--accent {
			background: linear-gradient(135deg, #eef2ff 0%, #ecfeff 100%);
			border-color: rgba(99, 102, 241, .15);
		}

		/* ============================================================
		   لوگوی پالسی متحرک (SVG + CSS)
		   ============================================================ */
		.pulse-wrap {
			position: relative;
			width: 132px;
			height: 132px;
			margin: 0 auto;
			display: flex;
			align-items: center;
			justify-content: center;
		}

		.pulse-svg {
			width: 100%;
			height: 100%;
			display: block;
			overflow: visible;
		}

		.pulse-ring {
			fill: none;
			stroke: #6366f1;
			stroke-width: 1.6;
			transform-origin: 70px 70px;
			animation: pulseRing 3.6s cubic-bezier(.25, .6, .35, 1) infinite;
		}

		.pulse-ring--2 { stroke: #8b5cf6; animation-delay: 1.2s; }
		.pulse-ring--3 { stroke: #06b6d4; animation-delay: 2.4s; }

		@keyframes pulseRing {
			0%   { transform: scale(0.72); opacity: .85; }
			70%  { opacity: .18; }
			100% { transform: scale(1.9); opacity: 0; }
		}

		.pulse-core {
			transform-origin: 70px 70px;
			animation: pulseCore 2.2s ease-in-out infinite;
			filter: drop-shadow(0 0 0 transparent);
		}

		@keyframes pulseCore {
			0%, 100% { transform: scale(1); }
			50%      { transform: scale(1.06); }
		}

		.pulse-halo {
			transform-origin: 70px 70px;
			animation: haloRotate 9s linear infinite;
		}

		@keyframes haloRotate {
			to { transform: rotate(360deg); }
		}

		/* ============================================================
		   فیلدهای فرم
		   ============================================================ */
		.field-input {
			width: 100%;
			padding: 14px 46px 14px 46px;
			background: #f8fafc;
			border: 1px solid #e2e8f0;
			border-radius: 14px;
			color: #0f172a;
			font-size: .95rem;
			outline: none;
			transition: border-color .2s ease, background .2s ease, box-shadow .2s ease;
		}

		.field-input::placeholder { color: #94a3b8; }

		.field-input:hover { border-color: #cbd5e1; }

		.field-input:focus {
			background: #ffffff;
			border-color: #6366f1;
			box-shadow: 0 0 0 4px rgba(99, 102, 241, .12);
		}

		.field-input:-webkit-autofill,
		.field-input:-webkit-autofill:hover,
		.field-input:-webkit-autofill:focus {
			-webkit-text-fill-color: #0f172a;
			-webkit-box-shadow: 0 0 0 1000px #ffffff inset;
			transition: background-color 5000s ease-in-out 0s;
		}

		.field-icon {
			position: absolute;
			top: 50%;
			right: 14px;
			transform: translateY(-50%);
			color: #94a3b8;
			pointer-events: none;
			display: flex;
			transition: color .2s ease;
		}

		.field-icon svg { width: 19px; height: 19px; display: block; }

		.field-group:focus-within .field-icon { color: #6366f1; }

		.toggle-pass {
			position: absolute;
			top: 50%;
			left: 8px;
			transform: translateY(-50%);
			width: 34px;
			height: 34px;
			display: flex;
			align-items: center;
			justify-content: center;
			background: transparent;
			border: 0;
			border-radius: 10px;
			color: #94a3b8;
			cursor: pointer;
			transition: color .2s ease, background .2s ease;
		}

		.toggle-pass:hover { color: #475569; background: #f1f5f9; }
		.toggle-pass svg { width: 18px; height: 18px; display: block; }
		.toggle-pass .eye-off { display: none; }
		.toggle-pass.is-visible .eye-open { display: none; }
		.toggle-pass.is-visible .eye-off { display: block; }

		/* ============================================================
		   دکمه ورود
		   ============================================================ */
		.btn-login {
			width: 100%;
			padding: 14px 18px;
			border: 0;
			border-radius: 14px;
			cursor: pointer;
			display: flex;
			align-items: center;
			justify-content: center;
			gap: 9px;
			font-family: inherit;
			font-size: .98rem;
			font-weight: 700;
			color: #ffffff;
			background: linear-gradient(135deg, #6366f1 0%, #7c3aed 55%, #0891b2 100%);
			background-size: 180% 180%;
			transition: transform .2s ease, background-position .5s ease, box-shadow .2s ease;
		}

		.btn-login svg { width: 19px; height: 19px; }

		.btn-login:hover {
			transform: translateY(-1px);
			background-position: 100% 50%;
			box-shadow: 0 6px 18px -8px rgba(99, 102, 241, .7);
		}

		.btn-login:active { transform: translateY(0) scale(.995); }

		.btn-login:focus-visible {
			outline: 2px solid #6366f1;
			outline-offset: 3px;
		}

		/* ============================================================
		   خطا
		   ============================================================ */
		.form-login-error {
			display: none;
			background: #fef2f2;
			border: 1px solid #fecaca;
			color: #b91c1c;
			padding: 11px 14px;
			border-radius: 14px;
			font-size: .84rem;
			text-align: center;
			line-height: 1.7;
			animation: shake .45s ease;
		}

		.form-login-error h3 { font-size: .88rem; font-weight: 600; }

		@keyframes shake {
			0%, 100% { transform: translateX(0); }
			25%      { transform: translateX(-6px); }
			75%      { transform: translateX(6px); }
		}

		/* ============================================================
		   دکمه‌های شبکه‌های اجتماعی
		   ============================================================ */
		.social-btn {
			display: inline-flex;
			align-items: center;
			justify-content: center;
			width: 42px;
			height: 42px;
			border-radius: 13px;
			border: 1px solid #e2e8f0;
			background: #ffffff;
			color: #475569;
			transition: transform .2s ease, border-color .2s ease, color .2s ease, background .2s ease;
		}

		.social-btn svg { width: 20px; height: 20px; display: block; }

		.social-btn:hover { transform: translateY(-2px); }

		.social-btn--telegram:hover { color: #229ED9; border-color: #229ED9; background: #f0f9ff; }
		.social-btn--whatsapp:hover { color: #25D366; border-color: #25D366; background: #f0fdf4; }
		.social-btn--bale:hover     { color: #16a34a; border-color: #16a34a; background: #f0fdf4; }

		/* ============================================================
		   نوار تاریخ شمسی
		   ============================================================ */
		.date-chip {
			display: inline-flex;
			align-items: center;
			gap: 7px;
			font-size: .82rem;
			color: #4338ca;
			font-weight: 500;
		}

		.date-chip svg { width: 15px; height: 15px; opacity: .8; }

		.date-time {
			display: inline-flex;
			align-items: center;
			gap: 6px;
			font-size: .82rem;
			color: #0e7490;
			font-weight: 500;
			font-variant-numeric: tabular-nums;
		}

		/* ============================================================
		   انیمیشن ورود کارت
		   ============================================================ */
		.bento-grid > .bento-cell {
			animation: cellIn .55s cubic-bezier(.2, .85, .25, 1) both;
		}
		.bento-grid > .bento-cell:nth-child(1) { animation-delay: .02s; }
		.bento-grid > .bento-cell:nth-child(2) { animation-delay: .08s; }
		.bento-grid > .bento-cell:nth-child(3) { animation-delay: .14s; }
		.bento-grid > .bento-cell:nth-child(4) { animation-delay: .20s; }
		.bento-grid > .bento-cell:nth-child(5) { animation-delay: .26s; }

		@keyframes cellIn {
			from { opacity: 0; transform: translateY(14px); }
			to   { opacity: 1; transform: translateY(0); }
		}

		@media (prefers-reduced-motion: reduce) {
			*, *::before, *::after {
				animation-duration: .01ms !important;
				animation-iteration-count: 1 !important;
				transition-duration: .01ms !important;
			}
		}
		
		/* ============================================================
		   المان‌های نوری مات و بلور متحرک (Glass Blobs)
		   ============================================================ */
		.bg-blobs {
			position: fixed;
			inset: 0;
			overflow: hidden;
			pointer-events: none; 
			z-index: 1; 
		}

		/* پوشش برای انیمیشن‌های خودکار CSS */
		.blob-wrapper {
			position: absolute;
			will-change: transform;
		}

		/* هسته نور که با موس حرکت می‌کند */
		.blob {
			border-radius: 50%;
			filter: blur(80px); /* افکت مات و شیشه‌ای */
			opacity: 0.65;
			will-change: transform;
		}

		/* تعریف رنگ‌ها و ابعاد */
		.blob-1 { width: 450px; height: 450px; background: radial-gradient(circle, #818cf8 0%, rgba(129, 140, 248, 0) 70%); }
		.blob-2 { width: 550px; height: 550px; background: radial-gradient(circle, #22d3ee 0%, rgba(34, 211, 238, 0) 70%); }
		.blob-3 { width: 400px; height: 400px; background: radial-gradient(circle, #c084fc 0%, rgba(192, 132, 252, 0) 70%); }
		.blob-4 { width: 350px; height: 350px; background: radial-gradient(circle, #f472b6 0%, rgba(244, 114, 182, 0) 70%); }
		/* رنگ نارنجی */
		.blob-5 { width: 480px; height: 480px; background: radial-gradient(circle, #f97316 0%, rgba(249, 115, 22, 0) 70%); }

		/* موقعیت‌دهی و انیمیشن‌های خودکار (حرکت آرام در پس‌زمینه) */
		.wrapper-1 { top: -10%; left: -10%; animation: move1 15s infinite alternate cubic-bezier(0.4, 0, 0.2, 1); }
		.wrapper-2 { bottom: -20%; right: -10%; animation: move2 20s infinite alternate cubic-bezier(0.4, 0, 0.2, 1); }
		.wrapper-3 { top: 40%; left: 40%; animation: move3 18s infinite alternate cubic-bezier(0.4, 0, 0.2, 1); }
		.wrapper-4 { top: 60%; left: 10%; animation: move4 25s infinite alternate cubic-bezier(0.4, 0, 0.2, 1); }
		.wrapper-5 { bottom: 15%; left: 25%; animation: move5 22s infinite alternate cubic-bezier(0.4, 0, 0.2, 1); }

		@keyframes move1 { 0% { transform: translate(0, 0) scale(1); } 100% { transform: translate(150px, 100px) scale(1.2); } }
		@keyframes move2 { 0% { transform: translate(0, 0) scale(1); } 100% { transform: translate(-150px, -100px) scale(1.3); } }
		@keyframes move3 { 0% { transform: translate(0, 0) scale(1); } 100% { transform: translate(-100px, 150px) scale(0.8); } }
		@keyframes move4 { 0% { transform: translate(0, 0) scale(1); } 100% { transform: translate(200px, -50px) scale(1.1); } }
		@keyframes move5 { 0% { transform: translate(0, 0) scale(1); } 100% { transform: translate(-80px, -120px) scale(1.15); } }
		
	</style>
	{/literal}

	{$HEADER_LIBS_JQUERY}
</head>

<body class="login-page">

	<!-- المان‌های نوری متحرک پس‌زمینه -->
	<div class="bg-blobs" aria-hidden="true">
		<div class="blob-wrapper wrapper-1"><div class="blob blob-1"></div></div>
		<div class="blob-wrapper wrapper-2"><div class="blob blob-2"></div></div>
		<div class="blob-wrapper wrapper-3"><div class="blob blob-3"></div></div>
		<div class="blob-wrapper wrapper-4"><div class="blob blob-4"></div></div>
		<!-- لایه نارنجی جدید -->
		<div class="blob-wrapper wrapper-5"><div class="blob blob-5"></div></div>
	</div>
	
	<main class="relative z-10 min-h-screen flex items-center justify-center px-4 py-8">

		<div class="w-full max-w-md">

			<!-- عنوان بالای کارت -->
			<div class="text-center mb-5">
				<h1 class="text-2xl font-bold bg-gradient-to-l from-indigo-600 via-violet-600 to-cyan-600 bg-clip-text text-transparent">
					VoipTel Pro
				</h1>
				<p class="text-sm text-slate-500 mt-1">ورود به پنل مدیریت</p>
			</div>

			<!-- ============================================================
			     BENTO GRID
			     ============================================================ -->
			<div class="bento-grid">

				<!-- ====== سلول تاریخ شمسی (تمام عرض) ====== -->
				<div class="bento-cell bento-cell--full bento-cell--accent px-5 py-3 flex items-center justify-between flex-wrap gap-2">
					<span class="date-chip">
						<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
							<rect x="3" y="4" width="18" height="18" rx="2.5"/>
							<path d="M16 2v4M8 2v4M3 10h18"/>
						</svg>
						<span id="jalaliDate">در حال بارگذاری…</span>
					</span>

					<span class="date-time">
						<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
							<circle cx="12" cy="12" r="9"/>
							<path d="M12 7v5l3.2 1.9"/>
						</svg>
						<span id="jalaliTime">--:--</span>
					</span>
				</div>

				<!-- ====== سلول لوگوی پالسی (تمام عرض) ====== -->
				<div class="bento-cell bento-cell--full px-5 pt-5 pb-3">
					<div class="pulse-wrap">
						<svg class="pulse-svg" viewBox="0 0 140 140" aria-hidden="true">
							<defs>
								<linearGradient id="pulseCoreGrad" x1="0" y1="0" x2="1" y2="1">
									<stop offset="0%" stop-color="#6366f1"/>
									<stop offset="55%" stop-color="#7c3aed"/>
									<stop offset="100%" stop-color="#06b6d4"/>
								</linearGradient>
								<radialGradient id="pulseHaloGrad" cx="50%" cy="50%" r="50%">
									<stop offset="0%" stop-color="#a5b4fc" stop-opacity=".55"/>
									<stop offset="100%" stop-color="#a5b4fc" stop-opacity="0"/>
								</radialGradient>
							</defs>

							<!-- هاله ملایم -->
							<circle cx="70" cy="70" r="52" fill="url(#pulseHaloGrad)"/>

							<!-- حلقه‌های پالسی -->
							<circle class="pulse-ring"              cx="70" cy="70" r="30"/>
							<circle class="pulse-ring pulse-ring--2" cx="70" cy="70" r="30"/>
							<circle class="pulse-ring pulse-ring--3" cx="70" cy="70" r="30"/>

							<!-- حلقه چرخان ظریف -->
							<g class="pulse-halo">
								<circle cx="70" cy="70" r="42" fill="none" stroke="#c7d2fe" stroke-width="1" stroke-dasharray="3 7"/>
							</g>

							<!-- هسته -->
							<circle class="pulse-core" cx="70" cy="70" r="30" fill="url(#pulseCoreGrad)"/>

							<!-- آیکون داخل هسته: خط پالس -->
							<path d="M46 70 h10 l6 -13 l8 26 l6 -13 h18"
							      fill="none" stroke="#ffffff" stroke-width="3"
							      stroke-linecap="round" stroke-linejoin="round"
							      class="pulse-core"/>
						</svg>
					</div>

					<p class="text-center text-xs text-slate-400 mt-1">سیستم آماده ورود</p>
				</div>

				<!-- ====== سلول فرم (تمام عرض) ====== -->
				<div class="bento-cell bento-cell--full p-5">

					{if !empty({$LOGIN_INCORRECT})}
					<div class="form-login-error mb-4">
						<h3>{$LOGIN_INCORRECT}</h3>
					</div>
					{literal}
					<script>
						document.addEventListener('DOMContentLoaded', function () {
							var err = document.querySelector('.form-login-error');
							if (err) { err.style.display = 'block'; }
						});
					</script>
					{/literal}
					{/if}

					<form method="post" id="loginForm" autocomplete="off" novalidate class="space-y-3">

						<div class="field-group relative">
							<input type="text" id="input_user" name="input_user"
								class="field-input"
								placeholder="{$USERNAME}" autocomplete="off" spellcheck="false" required />
							<span class="field-icon">
								<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
									<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
									<circle cx="12" cy="7" r="4"/>
								</svg>
							</span>
						</div>

						<div class="field-group relative">
							<input type="password" id="input_pass" name="input_pass"
								class="field-input"
								placeholder="{$PASSWORD}" autocomplete="off" spellcheck="false" required />
							<span class="field-icon">
								<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
									<rect x="3" y="11" width="18" height="10.5" rx="2.5"/>
									<path d="M7 11V7a5 5 0 0 1 10 0v4"/>
								</svg>
							</span>
							<button type="button" class="toggle-pass" id="togglePass" aria-label="نمایش / پنهان کردن رمز عبور">
								<svg class="eye-open" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
									<path d="M1 12s4-7 11-7 11 7 11 7-4 7-11 7S1 12 1 12z"/>
									<circle cx="12" cy="12" r="3"/>
								</svg>
								<svg class="eye-off" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
									<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94"/>
									<path d="M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19"/>
									<path d="M14.12 14.12a3 3 0 1 1-4.24-4.24"/>
									<path d="M1 1l22 22"/>
								</svg>
							</button>
						</div>

						<button type="submit" class="btn-login" name="submit_login">
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.1" stroke-linecap="round" stroke-linejoin="round">
								<path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/>
								<path d="M10 17l-5-5 5-5"/>
								<path d="M5 12h12"/>
							</svg>
							<span>{$SUBMIT}</span>
						</button>

					</form>
				</div>

				<!-- ====== سلول تماس (نصف عرض) ====== -->
				<div class="bento-cell p-4 flex flex-col justify-center gap-2">
					<a href="tel:09123456789" class="flex items-center gap-2 text-slate-700 hover:text-indigo-600 transition-colors text-sm">
						<span class="inline-flex items-center justify-center w-8 h-8 rounded-lg bg-indigo-50 text-indigo-600">
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" class="w-4 h-4">
								<path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72c.13.96.37 1.9.72 2.81a2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.91.35 1.85.59 2.81.72A2 2 0 0 1 22 16.92z"/>
							</svg>
						</span>
						<span dir="ltr">09123456789</span>
					</a>

					<a href="mailto:info@mail.com" class="flex items-center gap-2 text-slate-700 hover:text-indigo-600 transition-colors text-sm">
						<span class="inline-flex items-center justify-center w-8 h-8 rounded-lg bg-cyan-50 text-cyan-600">
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" class="w-4 h-4">
								<rect x="2" y="4" width="20" height="16" rx="3"/>
								<path d="m2 7 10 6 10-6"/>
							</svg>
						</span>
						<span dir="ltr">info@mail.com</span>
					</a>
				</div>

				<!-- ====== سلول شبکه‌های اجتماعی (نصف عرض) ====== -->
				<div class="bento-cell p-4 flex flex-col items-center justify-center gap-3">
					<span class="text-[.72rem] text-slate-400">ارتباط با ما</span>

					<div class="flex items-center justify-center gap-2">

						<!-- تلگرام -->
						<a href="https://t.me/S0TOUDEH" target="_blank" rel="noopener"
						   class="social-btn social-btn--telegram" aria-label="تلگرام" title="تلگرام">
							<svg viewBox="0 0 24 24" fill="currentColor">
								<path d="M9.78 18.65l.28-4.23 7.68-6.92c.34-.31-.07-.46-.52-.19L7.74 13.3 3.64 12c-.88-.25-.89-.86.2-1.3l15.97-6.16c.73-.33 1.43.18 1.15 1.3l-2.72 12.81c-.19.91-.74 1.13-1.5.71L12.6 16.3l-1.99 1.93c-.23.23-.42.42-.83.42z"/>
							</svg>
						</a>

						<!-- واتس‌اپ -->
						<a href="https://wa.me/989123456789" target="_blank" rel="noopener"
						   class="social-btn social-btn--whatsapp" aria-label="واتس‌اپ" title="واتس‌اپ">
							<svg viewBox="0 0 24 24" fill="currentColor">
								<path d="M12.04 2C6.58 2 2.13 6.45 2.13 11.91c0 1.75.46 3.45 1.32 4.95L2 22l5.25-1.38a9.9 9.9 0 0 0 4.79 1.22h.01c5.46 0 9.91-4.45 9.91-9.91 0-2.65-1.03-5.14-2.9-7.01A9.82 9.82 0 0 0 12.04 2zm0 18.15h-.01a8.2 8.2 0 0 1-4.19-1.15l-.3-.18-3.12.82.83-3.04-.2-.31a8.22 8.22 0 0 1-1.26-4.38c0-4.54 3.7-8.24 8.25-8.24 2.2 0 4.27.86 5.83 2.42a8.2 8.2 0 0 1 2.42 5.83c0 4.54-3.7 8.23-8.25 8.23zm4.52-6.16c-.25-.12-1.47-.72-1.69-.81-.23-.08-.39-.12-.56.12-.16.25-.64.81-.78.97-.15.17-.29.19-.54.06-.25-.12-1.05-.39-1.99-1.23-.74-.66-1.23-1.47-1.38-1.72-.14-.25-.01-.38.11-.51.11-.11.25-.29.37-.43.13-.15.17-.25.25-.41.08-.17.04-.31-.02-.43-.06-.12-.56-1.34-.76-1.84-.2-.48-.4-.42-.56-.43-.14 0-.31-.02-.47-.02s-.43.06-.66.31c-.22.25-.86.85-.86 2.07 0 1.22.89 2.4 1.01 2.56.12.17 1.75 2.67 4.23 3.74.59.26 1.05.41 1.41.52.59.19 1.13.16 1.56.1.48-.07 1.47-.6 1.68-1.18.21-.58.21-1.07.14-1.18-.06-.11-.22-.17-.47-.29z"/>
							</svg>
						</a>

						<!-- بله -->
						<a href="https://ble.ir/msotoudeh" target="_blank" rel="noopener"
						   class="social-btn social-btn--bale" aria-label="بله" title="بله">
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round">
								<path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"/>
								<path d="m9 12 2 2 4-4"/>
							</svg>
						</a>

					</div>
				</div>

			</div>

		</div>

	</main>

	{literal}
	<script>
	(function () {
		'use strict';

		/* ============================================================
		   ۱) تاریخ شمسی + ساعت زنده
		   ============================================================ */
		var dateEl = document.getElementById('jalaliDate');
		var timeEl = document.getElementById('jalaliTime');

		function pad2(n) { return (n < 10 ? '0' : '') + n; }

		function toPersianDigits(str) {
			var fa = ['۰','۱','۲','۳','۴','۵','۶','۷','۸','۹'];
			return String(str).replace(/[0-9]/g, function (d) { return fa[+d]; });
		}

		function updateDateTime() {
			var now = new Date();
			var dateStr, timeStr;

			try {
				// استخراج تک‌تک اجزای تاریخ برای فرمت‌دهی دقیق
				var parts = new Intl.DateTimeFormat('fa-IR', {
					weekday: 'long',
					year: 'numeric',
					month: 'long',
					day: 'numeric'
				}).formatToParts(now);

				var weekday = '', day = '', month = '', year = '';
				parts.forEach(function(p) {
					if (p.type === 'weekday') weekday = p.value;
					if (p.type === 'day') day = p.value;
					if (p.type === 'month') month = p.value;
					if (p.type === 'year') year = p.value;
				});

				// چیدن کنار هم با فرمت درخواستی: امروز [روز هفته] ، [روز] [ماه] [سال]
				dateStr = 'امروز ' + weekday + ' ، ' + day + ' ' + month + ' ' + year;
			} catch (e) {
				dateStr = 'امروز ' + toPersianDigits(now.toLocaleDateString());
			}

			try {
				timeStr = new Intl.DateTimeFormat('fa-IR', {
					hour: '2-digit',
					minute: '2-digit',
					second: '2-digit',
					hour12: false
				}).format(now);
			} catch (e) {
				timeStr = toPersianDigits(pad2(now.getHours()) + ':' + pad2(now.getMinutes()) + ':' + pad2(now.getSeconds()));
			}

			if (dateEl) { dateEl.textContent = dateStr; }
			if (timeEl) { timeEl.textContent = timeStr; }
		}

		updateDateTime();
		setInterval(updateDateTime, 1000);

		/* ============================================================
		   ۲) نمایش / پنهان کردن رمز عبور
		   ============================================================ */
		var toggleBtn = document.getElementById('togglePass');
		var passInput = document.getElementById('input_pass');

		if (toggleBtn && passInput) {
			toggleBtn.addEventListener('click', function () {
				var show = passInput.type === 'password';
				passInput.type = show ? 'text' : 'password';
				toggleBtn.classList.toggle('is-visible', show);
				toggleBtn.setAttribute('aria-label', show ? 'پنهان کردن رمز عبور' : 'نمایش رمز عبور');
				passInput.focus();
			});
		}

		/* ============================================================
		   ۳) اعتبارسنجی ساده قبل از ارسال
		   ============================================================ */
		var form = document.getElementById('loginForm');
		if (form) {
			form.addEventListener('submit', function (ev) {
				var u = document.getElementById('input_user');
				var p = document.getElementById('input_pass');
				if (!u.value.trim() || !p.value) {
					ev.preventDefault();
					var target = !u.value.trim() ? u : p;
					target.focus();
					target.style.borderColor = '#ef4444';
					target.style.boxShadow = '0 0 0 4px rgba(239,68,68,.14)';
					setTimeout(function () {
						target.style.borderColor = '';
						target.style.boxShadow = '';
					}, 1400);
				}
			});
		}

	})();
	
			/* ============================================================
		   ۴) حرکت المان‌های نوری با حرکت موس (Parallax)
		   ============================================================ */
		(function() {
			var blobs = document.querySelectorAll('.blob');
			var mouseX = 0;
			var mouseY = 0;
			var targetX = 0;
			var targetY = 0;
			var speed = 0.08; // میزان نرمی حرکت (هرچه کمتر، نرم‌تر)

			// شناسایی موقعیت موس
			window.addEventListener('mousemove', function(e) {
				// محاسبه فاصله موس از مرکز صفحه
				targetX = (e.clientX - window.innerWidth / 2) * 0.15;
				targetY = (e.clientY - window.innerHeight / 2) * 0.15;
			});

			// تابع انیمیشن برای حرکت نرم
			function animateBlobs() {
				// حرکت نرم به سمت هدف (Lerp)
				mouseX += (targetX - mouseX) * speed;
				mouseY += (targetY - mouseY) * speed;

				blobs.forEach(function(blob, index) {
					// هر المان با سرعت متفاوتی حرکت می‌کند تا حس عمق (3D) ایجاد شود
					var depth = (index + 1) * 0.4; 
					blob.style.transform = 'translate(' + (mouseX * depth) + 'px, ' + (mouseY * depth) + 'px)';
				});

				requestAnimationFrame(animateBlobs);
			}

			// شروع انیمیشن
			animateBlobs();
		})();
		
	</script>
	{/literal}

</body>
</html>