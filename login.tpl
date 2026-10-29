<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Issabel Admin" />
	<meta name="theme-color" content="#f8fafc" />

	<!-- جلوگیری از کش شدن صفحه تا کپچا در هر رفرش تغییر کند -->
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />

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
			gap: 10px;
		}
		.bento-cell {
			background: #ffffff;
			border: 1px solid rgba(15, 23, 42, .07);
			border-radius: 20px;
			position: relative;
			overflow: hidden;
		}
		.bento-cell--full { grid-column: 1 / -1; }
		.bento-cell--accent {
			background: linear-gradient(135deg, #eef2ff 0%, #ecfeff 100%);
			border-color: rgba(99, 102, 241, .15);
		}

		/* ============================================================
		   لوگوی پالسی متحرک (کوچک و افقی)
		   ============================================================ */
		.pulse-wrap {
			position: relative;
			width: 60px;
			height: 60px;
			display: flex;
			align-items: center;
			justify-content: center;
			flex-shrink: 0;
		}
		.pulse-svg { width: 100%; height: 100%; display: block; overflow: visible; }
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
		}
		@keyframes pulseCore {
			0%, 100% { transform: scale(1); }
			50%      { transform: scale(1.06); }
		}
		.pulse-halo {
			transform-origin: 70px 70px;
			animation: haloRotate 9s linear infinite;
		}
		@keyframes haloRotate { to { transform: rotate(360deg); } }

		/* ============================================================
		   فیلدهای فرم
		   ============================================================ */
		.field-input {
			width: 100%;
			padding: 12px 42px 12px 42px;
			background: #f8fafc;
			border: 1px solid #e2e8f0;
			border-radius: 12px;
			color: #0f172a;
			font-size: .9rem;
			outline: none;
			transition: border-color .2s ease, background .2s ease, box-shadow .2s ease;
		}
		.field-input::placeholder { color: #94a3b8; }
		.field-input:hover { border-color: #cbd5e1; }
		.field-input:focus {
			background: #ffffff;
			border-color: #6366f1;
			box-shadow: 0 0 0 3px rgba(99, 102, 241, .12);
		}
		.field-icon {
			position: absolute;
			top: 50%;
			right: 12px;
			transform: translateY(-50%);
			color: #94a3b8;
			pointer-events: none;
			display: flex;
			transition: color .2s ease;
		}
		.field-icon svg { width: 18px; height: 18px; display: block; }
		.field-group:focus-within .field-icon { color: #6366f1; }

		.toggle-pass {
			position: absolute;
			top: 50%;
			left: 6px;
			transform: translateY(-50%);
			width: 32px;
			height: 32px;
			display: flex;
			align-items: center;
			justify-content: center;
			background: transparent;
			border: 0;
			border-radius: 8px;
			color: #94a3b8;
			cursor: pointer;
			transition: color .2s ease, background .2s ease;
		}
		.toggle-pass:hover { color: #475569; background: #f1f5f9; }
		.toggle-pass svg { width: 16px; height: 16px; display: block; }
		.toggle-pass .eye-off { display: none; }
		.toggle-pass.is-visible .eye-open { display: none; }
		.toggle-pass.is-visible .eye-off { display: block; }

		/* ============================================================
		   دکمه ورود
		   ============================================================ */
		.btn-login {
			width: 100%;
			padding: 13px 18px;
			border: 0;
			border-radius: 12px;
			cursor: pointer;
			display: flex;
			align-items: center;
			justify-content: center;
			gap: 8px;
			font-family: inherit;
			font-size: .95rem;
			font-weight: 700;
			color: #ffffff;
			background: linear-gradient(135deg, #6366f1 0%, #7c3aed 55%, #0891b2 100%);
			background-size: 180% 180%;
			transition: transform .2s ease, background-position .5s ease, box-shadow .2s ease;
		}
		.btn-login svg { width: 18px; height: 18px; }
		.btn-login:hover {
			transform: translateY(-1px);
			background-position: 100% 50%;
			box-shadow: 0 6px 18px -8px rgba(99, 102, 241, .7);
		}
		.btn-login:active { transform: translateY(0) scale(.995); }
		.btn-login:focus-visible { outline: 2px solid #6366f1; outline-offset: 3px; }

		/* ============================================================
		   خطا
		   ============================================================ */
		.form-login-error {
			display: none;
			background: #fef2f2;
			border: 1px solid #fecaca;
			color: #b91c1c;
			padding: 10px 12px;
			border-radius: 12px;
			font-size: .82rem;
			text-align: center;
			line-height: 1.6;
			animation: shake .45s ease;
		}
		.form-login-error h3 { font-size: .86rem; font-weight: 600; }
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
			width: 34px;
			height: 34px;
			border-radius: 10px;
			border: 1px solid #e2e8f0;
			background: #ffffff;
			color: #475569;
			transition: transform .2s ease, border-color .2s ease, color .2s ease, background .2s ease;
		}
		.social-btn svg { width: 16px; height: 16px; display: block; }
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
			gap: 6px;
			font-size: .78rem;
			color: #4338ca;
			font-weight: 500;
		}
		.date-chip svg { width: 14px; height: 14px; opacity: .8; }
		.date-time {
			display: inline-flex;
			align-items: center;
			gap: 5px;
			font-size: .78rem;
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
		   المان‌های نوری مات و بلور متحرک
		   ============================================================ */
		.bg-blobs {
			position: fixed;
			inset: 0;
			overflow: hidden;
			pointer-events: none;
			z-index: 1;
		}
		.blob-wrapper { position: absolute; will-change: transform; }
		.blob { border-radius: 50%; filter: blur(80px); opacity: 0.65; will-change: transform; }
		.blob-1 { width: 450px; height: 450px; background: radial-gradient(circle, #818cf8 0%, rgba(129, 140, 248, 0) 70%); }
		.blob-2 { width: 550px; height: 550px; background: radial-gradient(circle, #22d3ee 0%, rgba(34, 211, 238, 0) 70%); }
		.blob-3 { width: 400px; height: 400px; background: radial-gradient(circle, #c084fc 0%, rgba(192, 132, 252, 0) 70%); }
		.blob-4 { width: 350px; height: 350px; background: radial-gradient(circle, #f472b6 0%, rgba(244, 114, 182, 0) 70%); }
		.blob-5 { width: 480px; height: 480px; background: radial-gradient(circle, #f97316 0%, rgba(249, 115, 22, 0) 70%); }
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

		/* ============================================================
		   کپچا
		   ============================================================ */
		.captcha-row {
			display: flex;
			align-items: stretch;
			gap: 8px;
		}
		.captcha-input {
			flex: 1 1 auto;
			min-width: 0;
			padding: 12px 16px !important;
			text-align: center;
			font-size: 1.1rem !important;
			font-weight: 700;
			letter-spacing: 2px;
			font-variant-numeric: tabular-nums;
			direction: ltr;
		}
		.captcha-visual {
			flex: 0 0 auto;
			display: flex;
			align-items: center;
			gap: 4px;
			padding: 3px;
			background: #ffffff;
			border: 1px solid #e2e8f0;
			border-radius: 12px;
			transition: border-color .2s ease;
		}
		.captcha-visual:hover { border-color: #cbd5e1; }
		.captcha-visual canvas {
			display: block;
			border-radius: 8px;
			cursor: pointer;
			user-select: none;
			-webkit-user-select: none;
			touch-action: manipulation;
		}
		.captcha-refresh {
			width: 28px;
			height: 28px;
			display: flex;
			align-items: center;
			justify-content: center;
			background: #f8fafc;
			border: 0;
			border-radius: 8px;
			color: #64748b;
			cursor: pointer;
			transition: background .2s ease, color .2s ease, transform .35s ease;
		}
		.captcha-refresh:hover { background: #eef2ff; color: #6366f1; }
		.captcha-refresh:active { transform: rotate(180deg); }
		.captcha-refresh svg { width: 15px; height: 15px; display: block; }
		.captcha-error-msg {
			display: none;
			color: #b91c1c;
			font-size: .76rem;
			margin-top: 4px;
			text-align: center;
			font-weight: 500;
		}
		.captcha-error-msg.show {
			display: block;
			animation: shake .45s ease;
		}

		/* ============================================================
		   پنل ارتباط با ما (جمع‌شو)
		   ============================================================ */
		.contact-toggle {
			width: 100%;
			display: flex;
			align-items: center;
			gap: 10px;
			padding: 10px 14px;
			background: transparent;
			border: 0;
			cursor: pointer;
			border-radius: 20px;
			font-family: inherit;
			transition: background .2s ease;
		}
		.contact-toggle:hover { background: #f8fafc; }
		.contact-toggle:focus-visible { outline: 2px solid #6366f1; outline-offset: -2px; }
		.contact-chevron {
			transition: transform .3s cubic-bezier(.4, 0, .2, 1);
			flex-shrink: 0;
		}
		.contact-toggle[aria-expanded="true"] .contact-chevron {
			transform: rotate(180deg);
		}
		.contact-content {
			display: grid;
			grid-template-rows: 0fr;
			transition: grid-template-rows .35s cubic-bezier(.4, 0, .2, 1);
		}
		.contact-content > .contact-inner { overflow: hidden; }
		.contact-content.is-open { grid-template-rows: 1fr; }
		.contact-inner-pad { padding: 0 12px 12px; }

		.contact-item {
			display: flex;
			align-items: center;
			justify-content: center;
			gap: 6px;
			padding: 7px 8px;
			border-radius: 10px;
			background: #f8fafc;
			border: 1px solid #e2e8f0;
			color: #475569;
			text-decoration: none;
			font-size: .78rem;
			transition: border-color .2s, color .2s, background .2s, transform .2s;
		}
		.contact-item:hover {
			color: #6366f1;
			border-color: #c7d2fe;
			background: #eef2ff;
			transform: translateY(-1px);
		}
		.contact-item svg { width: 14px; height: 14px; flex-shrink: 0; }
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
		<div class="blob-wrapper wrapper-5"><div class="blob blob-5"></div></div>
	</div>

	<main class="relative z-10 min-h-screen flex items-center justify-center px-4 py-6">
		<div class="w-full max-w-md">

			<!-- هدر صفحه -->
			<div class="text-center mb-4">
				<h1 class="text-2xl font-bold bg-gradient-to-l from-indigo-600 via-violet-600 to-cyan-600 bg-clip-text text-transparent">
					Issabel
				</h1>
				<p class="text-xs text-slate-500 mt-0.5">ورود به پنل مدیریت</p>
			</div>

			<div class="bento-grid">

				<!-- تاریخ شمسی و ساعت -->
				<div class="bento-cell bento-cell--full bento-cell--accent px-4 py-2.5 flex items-center justify-between flex-wrap gap-2">
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

				<!-- کادر لوگو (تغییر یافته به حالت افقی و کوچک) -->
				<div class="bento-cell bento-cell--full px-4 py-3 flex items-center justify-center gap-4">
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
							<circle cx="70" cy="70" r="52" fill="url(#pulseHaloGrad)"/>
							<circle class="pulse-ring"              cx="70" cy="70" r="30"/>
							<circle class="pulse-ring pulse-ring--2" cx="70" cy="70" r="30"/>
							<circle class="pulse-ring pulse-ring--3" cx="70" cy="70" r="30"/>
							<g class="pulse-halo">
								<circle cx="70" cy="70" r="42" fill="none" stroke="#c7d2fe" stroke-width="1" stroke-dasharray="3 7"/>
							</g>
							<circle class="pulse-core" cx="70" cy="70" r="30" fill="url(#pulseCoreGrad)"/>
							<path d="M46 70 h10 l6 -13 l8 26 l6 -13 h18"
							      fill="none" stroke="#ffffff" stroke-width="3"
							      stroke-linecap="round" stroke-linejoin="round"
							      class="pulse-core"/>
						</svg>
					</div>
					<div class="flex flex-col text-right">
						<span class="text-sm font-semibold text-slate-700">سیستم آماده ورود</span>
						<span class="text-[.7rem] text-slate-400 mt-0.5">اتصال امن و رمزنگاری شده</span>
					</div>
				</div>

				<!-- فرم ورود + کپچا -->
				<div class="bento-cell bento-cell--full p-4 sm:p-5">

					{if !empty({$LOGIN_INCORRECT})}
					<div class="form-login-error mb-3">
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

						<!-- کپچای ۴ رقمی -->
						<div>
							<div class="captcha-row">
								<input type="text" id="input_captcha" name="input_captcha"
									class="field-input captcha-input"
									placeholder="کد امنیتی"
									inputmode="numeric" maxlength="4"
									autocomplete="one-time-code" spellcheck="false" required />
								<div class="captcha-visual">
									<canvas id="captchaCanvas" width="110" height="42"
										aria-label="کد امنیتی تصویری"
										title="برای تغییر کد کلیک کنید"></canvas>
									<button type="button" class="captcha-refresh" id="captchaRefresh"
										aria-label="تغییر کد امنیتی" title="تغییر کد">
										<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
											<path d="M21 12a9 9 0 1 1-3-6.7L21 8"/>
											<path d="M21 3v5h-5"/>
										</svg>
									</button>
								</div>
							</div>
							<p class="captcha-error-msg" id="captchaErrorMsg">کد امنیتی صحیح نیست، لطفاً دوباره تلاش کنید</p>
						</div>

						<button type="submit" class="btn-login mt-2" name="submit_login">
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.1" stroke-linecap="round" stroke-linejoin="round">
								<path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/>
								<path d="M10 17l-5-5 5-5"/>
								<path d="M5 12h12"/>
							</svg>
							<span>{$SUBMIT}</span>
						</button>

					</form>
				</div>

				<!-- ارتباط با ما (جمع‌شو) -->
				<div class="bento-cell bento-cell--full">
					<button type="button" class="contact-toggle" id="contactToggle"
						aria-expanded="false" aria-controls="contactContent">
						<span class="inline-flex items-center justify-center w-7 h-7 rounded-lg bg-indigo-50 text-indigo-600 shrink-0">
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" class="w-4 h-4">
								<path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72c.13.96.37 1.9.72 2.81a2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.91.35 1.85.59 2.81.72A2 2 0 0 1 22 16.92z"/>
							</svg>
						</span>
						<span class="flex-1 text-right text-sm font-medium text-slate-700">ارتباط با ما</span>
						<svg class="contact-chevron w-4 h-4 text-slate-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
							<path d="m6 9 6 6 6-6"/>
						</svg>
					</button>

					<div class="contact-content" id="contactContent">
						<div class="contact-inner">
							<div class="contact-inner-pad">
								<div class="grid grid-cols-2 gap-2 mb-2">
									<a href="tel:09113330765" class="contact-item">
										<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round">
											<path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72c.13.96.37 1.9.72 2.81a2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45c.91.35 1.85.59 2.81.72A2 2 0 0 1 22 16.92z"/>
										</svg>
										<span dir="ltr">09123456789</span>
									</a>
									<a href="mailto:info@demo.com" class="contact-item">
										<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round">
											<rect x="2" y="4" width="20" height="16" rx="3"/>
											<path d="m2 7 10 6 10-6"/>
										</svg>
										<span dir="ltr">info@demo.com</span>
									</a>
								</div>
								<div class="flex items-center justify-center gap-2 pt-1">
									<a href="https://t.me/989123456789" target="_blank" rel="noopener" class="social-btn social-btn--telegram" aria-label="تلگرام" title="تلگرام">
										<svg viewBox="0 0 24 24" fill="currentColor">
											<path d="M9.78 18.65l.28-4.23 7.68-6.92c.34-.31-.07-.46-.52-.19L7.74 13.3 3.64 12c-.88-.25-.89-.86.2-1.3l15.97-6.16c.73-.33 1.43.18 1.15 1.3l-2.72 12.81c-.19.91-.74 1.13-1.5.71L12.6 16.3l-1.99 1.93c-.23.23-.42.42-.83.42z"/>
										</svg>
									</a>
									<a href="https://wa.me/9899123456789" target="_blank" rel="noopener" class="social-btn social-btn--whatsapp" aria-label="واتس‌اپ" title="واتس‌اپ">
										<svg viewBox="0 0 24 24" fill="currentColor">
											<path d="M12.04 2C6.58 2 2.13 6.45 2.13 11.91c0 1.75.46 3.45 1.32 4.95L2 22l5.25-1.38a9.9 9.9 0 0 0 4.79 1.22h.01c5.46 0 9.91-4.45 9.91-9.91 0-2.65-1.03-5.14-2.9-7.01A9.82 9.82 0 0 0 12.04 2zm0 18.15h-.01a8.2 8.2 0 0 1-4.19-1.15l-.3-.18-3.12.82.83-3.04-.2-.31a8.22 8.22 0 0 1-1.26-4.38c0-4.54 3.7-8.24 8.25-8.24 2.2 0 4.27.86 5.83 2.42a8.2 8.2 0 0 1 2.42 5.83c0 4.54-3.7 8.23-8.25 8.23zm4.52-6.16c-.25-.12-1.47-.72-1.69-.81-.23-.08-.39-.12-.56.12-.16.25-.64.81-.78.97-.15.17-.29.19-.54.06-.25-.12-1.05-.39-1.99-1.23-.74-.66-1.23-1.47-1.38-1.72-.14-.25-.01-.38.11-.51.11-.11.25-.29.37-.43.13-.15.17-.25.25-.41.08-.17.04-.31-.02-.43-.06-.12-.56-1.34-.76-1.84-.2-.48-.4-.42-.56-.43-.14 0-.31-.02-.47-.02s-.43.06-.66.31c-.22.25-.86.85-.86 2.07 0 1.22.89 2.4 1.01 2.56.12.17 1.75 2.67 4.23 3.74.59.26 1.05.41 1.41.52.59.19 1.13.16 1.56.1.48-.07 1.47-.6 1.68-1.18.21-.58.21-1.07.14-1.18-.06-.11-.22-.17-.47-.29z"/>
										</svg>
									</a>
									<a href="https://ble.ir/9123456789" target="_blank" rel="noopener" class="social-btn social-btn--bale" aria-label="بله" title="بله">
										<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round">
											<path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"/>
											<path d="m9 12 2 2 4-4"/>
										</svg>
									</a>
								</div>
							</div>
						</div>
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
				var parts = new Intl.DateTimeFormat('fa-IR', {
					weekday: 'long', year: 'numeric', month: 'long', day: 'numeric'
				}).formatToParts(now);
				var weekday = '', day = '', month = '', year = '';
				parts.forEach(function (p) {
					if (p.type === 'weekday') weekday = p.value;
					if (p.type === 'day') day = p.value;
					if (p.type === 'month') month = p.value;
					if (p.type === 'year') year = p.value;
				});
				dateStr = 'امروز ' + weekday + ' ، ' + day + ' ' + month + ' ' + year;
			} catch (e) {
				dateStr = 'امروز ' + toPersianDigits(now.toLocaleDateString());
			}
			try {
				timeStr = new Intl.DateTimeFormat('fa-IR', {
					hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: false
				}).format(now);
			} catch (e) {
				timeStr = toPersianDigits(pad2(now.getHours()) + ':' + pad2(now.getMinutes()) + ':' + pad2(now.getSeconds()));
			}
			if (dateEl) dateEl.textContent = dateStr;
			if (timeEl) timeEl.textContent = timeStr;
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
		   ۳) کپچا - تولید + رسم + اعتبارسنجی
		   ============================================================ */
		var captchaCanvas = document.getElementById('captchaCanvas');
		var captchaRefresh = document.getElementById('captchaRefresh');
		var captchaInput = document.getElementById('input_captcha');
		var captchaErrorMsg = document.getElementById('captchaErrorMsg');
		var FA_DIGITS = ['۰','۱','۲','۳','۴','۵','۶','۷','۸','۹'];

		function normalizeDigits(str) {
			return String(str || '')
				.replace(/[۰-۹]/g, function (d) { return String.fromCharCode(d.charCodeAt(0) - 1776 + 48); })
				.replace(/[٠-٩]/g, function (d) { return String.fromCharCode(d.charCodeAt(0) - 1632 + 48); });
		}

		function secureRandomDigit() {
			if (window.crypto && typeof window.crypto.getRandomValues === 'function') {
				var arr = new Uint32Array(1);
				window.crypto.getRandomValues(arr);
				return arr[0] % 10;
			}
			return Math.floor(Math.random() * 10);
		}

		function randomDigits() {
			var d = [];
			for (var i = 0; i < 4; i++) d.push(secureRandomDigit());
			return d;
		}

		function drawCaptcha(digits) {
			if (!captchaCanvas) return;
			var ctx = captchaCanvas.getContext('2d');
			var w = captchaCanvas.width;
			var h = captchaCanvas.height;

			var bgGrad = ctx.createLinearGradient(0, 0, w, h);
			bgGrad.addColorStop(0, '#f8fafc');
			bgGrad.addColorStop(1, '#eef2ff');
			ctx.fillStyle = bgGrad;
			ctx.fillRect(0, 0, w, h);

			/* نقاط نویز */
			for (var i = 0; i < 45; i++) {
				ctx.fillStyle = 'rgba(' + Math.floor(Math.random() * 180) + ',' + Math.floor(Math.random() * 180) + ',' + Math.floor(Math.random() * 220) + ',0.45)';
				ctx.beginPath();
				ctx.arc(Math.random() * w, Math.random() * h, Math.random() * 1.2, 0, Math.PI * 2);
				ctx.fill();
			}

			/* خطوط نویز کم‌رنگ */
			for (var i2 = 0; i2 < 2; i2++) {
				ctx.strokeStyle = 'rgba(99,102,241,' + (0.08 + Math.random() * 0.08) + ')';
				ctx.lineWidth = 1;
				ctx.beginPath();
				ctx.moveTo(0, Math.random() * h);
				ctx.bezierCurveTo(w * 0.3, Math.random() * h, w * 0.7, Math.random() * h, w, Math.random() * h);
				ctx.stroke();
			}

			/* ارقام */
			ctx.direction = 'ltr';
			ctx.textAlign = 'center';
			ctx.textBaseline = 'middle';
			var pad = 12;
			var step = (w - pad * 2) / 4;
			var hues = [235, 265, 195, 320];

			for (var j = 0; j < 4; j++) {
				ctx.save();
				ctx.translate(pad + step * j + step / 2, h / 2 + (Math.random() - 0.5) * 4);
				ctx.rotate((Math.random() - 0.5) * 0.5);
				var size = 18 + Math.random() * 5;
				ctx.font = '900 ' + size + 'px Vazirmatn, Tahoma, sans-serif';
				var hue = hues[j % 4] + (Math.random() * 30 - 15);
				ctx.fillStyle = 'hsl(' + hue + ', 60%, 32%)';
				ctx.fillText(FA_DIGITS[digits[j]], 0, 0);
				ctx.restore();
			}

			/* خطوط نویز روی ارقام */
			for (var k = 0; k < 4; k++) {
				ctx.strokeStyle = 'rgba(' + Math.floor(Math.random() * 100) + ',' + Math.floor(Math.random() * 100) + ',' + Math.floor(Math.random() * 160) + ',' + (0.35 + Math.random() * 0.3) + ')';
				ctx.lineWidth = 1 + Math.random() * 1.2;
				ctx.beginPath();
				ctx.moveTo(Math.random() * w * 0.3, Math.random() * h);
				ctx.bezierCurveTo(w * 0.3, Math.random() * h, w * 0.7, Math.random() * h, w * 0.7 + Math.random() * w * 0.3, Math.random() * h);
				ctx.stroke();
			}

			/* نقاط روی ارقام */
			for (var m = 0; m < 15; m++) {
				ctx.fillStyle = 'rgba(' + Math.floor(Math.random() * 120) + ',' + Math.floor(Math.random() * 120) + ',' + Math.floor(Math.random() * 160) + ',0.6)';
				ctx.beginPath();
				ctx.arc(Math.random() * w, Math.random() * h, Math.random() * 1.2, 0, Math.PI * 2);
				ctx.fill();
			}

			captchaCanvas.dataset.value = digits.join('');
		}

		function refreshCaptcha() {
			drawCaptcha(randomDigits());
			if (captchaInput) {
				captchaInput.value = '';
				captchaInput.style.borderColor = '';
				captchaInput.style.boxShadow = '';
			}
			if (captchaErrorMsg) captchaErrorMsg.classList.remove('show');
		}

		if (captchaCanvas) {
			refreshCaptcha();

			captchaCanvas.addEventListener('click', function () {
				refreshCaptcha();
				if (captchaInput) captchaInput.focus();
			});

			if (captchaRefresh) {
				captchaRefresh.addEventListener('click', function () {
					refreshCaptcha();
					if (captchaInput) captchaInput.focus();
				});
			}

			if (captchaInput) {
				captchaInput.addEventListener('input', function () {
					var cleaned = this.value.replace(/[^0-9۰-۹٠-٩]/g, '').slice(0, 4);
					if (this.value !== cleaned) this.value = cleaned;
					if (captchaErrorMsg) captchaErrorMsg.classList.remove('show');
				});
			}

			if (document.fonts && document.fonts.ready) {
				document.fonts.ready.then(function () {
					var val = captchaCanvas.dataset.value;
					if (val && val.length === 4) {
						drawCaptcha(val.split('').map(Number));
					}
				});
			}
		}

		function forceNewCaptchaOnLoad() {
			if (captchaCanvas) refreshCaptcha();
		}

		window.addEventListener('load', function () {
			if (!captchaCanvas || !captchaCanvas.dataset.value) forceNewCaptchaOnLoad();
		});

		window.addEventListener('pageshow', function (event) {
			if (event.persisted) forceNewCaptchaOnLoad();
		});

		/* ============================================================
		   ۴) اعتبارسنجی فرم
		   ============================================================ */
		var form = document.getElementById('loginForm');
		if (form) {
			form.addEventListener('submit', function (ev) {
				var u = document.getElementById('input_user');
				var p = document.getElementById('input_pass');
				var c = document.getElementById('input_captcha');
				var hasError = false;
				var firstBad = null;

				function mark(el) {
					el.style.borderColor = '#ef4444';
					el.style.boxShadow = '0 0 0 3px rgba(239,68,68,.14)';
					setTimeout(function () {
						el.style.borderColor = '';
						el.style.boxShadow = '';
					}, 1400);
					if (!firstBad) firstBad = el;
				}

				if (!u.value.trim()) { mark(u); hasError = true; }
				if (!p.value) { mark(p); hasError = true; }

				if (c && captchaCanvas) {
					var entered = normalizeDigits(c.value.trim());
					var expected = captchaCanvas.dataset.value || '';
					if (entered.length !== 4 || entered !== expected) {
						mark(c);
						if (captchaErrorMsg) {
							captchaErrorMsg.classList.remove('show');
							void captchaErrorMsg.offsetWidth;
							captchaErrorMsg.classList.add('show');
						}
						drawCaptcha(randomDigits());
						c.value = '';
						hasError = true;
						if (!firstBad) firstBad = c;
					}
				}

				if (hasError) {
					ev.preventDefault();
					if (firstBad) firstBad.focus();
				}
			});
		}

		/* ============================================================
		   ۵) تاگل پنل ارتباط با ما
		   ============================================================ */
		var contactToggle = document.getElementById('contactToggle');
		var contactContent = document.getElementById('contactContent');
		if (contactToggle && contactContent) {
			contactToggle.addEventListener('click', function () {
				var isOpen = contactContent.classList.toggle('is-open');
				contactToggle.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
			});
		}

	})();

	/* ============================================================
	   ۶) پارالاکس پس‌زمینه
	   ============================================================ */
	(function () {
		var blobs = document.querySelectorAll('.blob');
		var mouseX = 0, mouseY = 0, targetX = 0, targetY = 0;
		var speed = 0.08;

		window.addEventListener('mousemove', function (e) {
			targetX = (e.clientX - window.innerWidth / 2) * 0.15;
			targetY = (e.clientY - window.innerHeight / 2) * 0.15;
		});

		function animateBlobs() {
			mouseX += (targetX - mouseX) * speed;
			mouseY += (targetY - mouseY) * speed;
			blobs.forEach(function (blob, index) {
				var depth = (index + 1) * 0.4;
				blob.style.transform = 'translate(' + (mouseX * depth) + 'px, ' + (mouseY * depth) + 'px)';
			});
			requestAnimationFrame(animateBlobs);
		}
		animateBlobs();
	})();
	</script>
	{/literal}

</body>
</html>
