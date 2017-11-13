Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eECtI-0002uu-5Z
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 06:27:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eECtF-0002u8-I6
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 06:26:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eECtE-0003Mv-JT
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 06:26:57 -0500
Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232]:43662)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eECtE-0003Kn-86
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 06:26:56 -0500
Received: by mail-wr0-x232.google.com with SMTP id 4so14124312wrt.0
	for <qemu-trivial@nongnu.org>; Mon, 13 Nov 2017 03:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yNhxVHZ66BEPoKhid0zfDRpdvrqJE1/qX/uHY6rb6Xs=;
	b=DIWgQzl1G7fzEvj4AzvAdBTmkC99Gt7yo3AIyqYLX0J8g23V1ezj7iJE0oU3QMe/kT
	JKo8UINvvd12nh2jO2T0gl1Lak0J8HWMOdWW5qXwWMhEOS+PCSPejXIbftbjSh43W1We
	5Sr3lt+LmO0PZ+URPfWmAFZA5U4Df5q2SEH0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yNhxVHZ66BEPoKhid0zfDRpdvrqJE1/qX/uHY6rb6Xs=;
	b=E8qUdJvZNjH0DF0m2ap3zSk8na4zAw8FAZPAyhfh+9PjLopwHcVRfTzriFg481eKqx
	oU1prWEYM39EurMLemLesNp53Ljes+gaRtNeJqFUfMlQhJ9xcAEvnnoOw7x2wEM0hhka
	ZF6eG8qIM2OW35T90MKd9OM1H0gf8M2QbihbHnPfpdJZ+P87kKJhZYHd3XxgmZxQrXV+
	u1G4t0A02Zux5KQu/XBlTy2a8Ey9a6qqh77RAQvZ89jPHemC3Uk0Oz/YvvhVU/6SEBSf
	/jsus36j0VA0jps4B1gi801TEfY7NVapwcSJ50ad46q6DU4AQ8VQ0mUKSnlOzPG4L8Dc
	FBIA==
X-Gm-Message-State: AJaThX6uKDb4bOZK0qT2tlm80hVuM7pRrQb/MEP4cZjLSTh6YvoyQJYc
	n+n4oouAVFLVoZqu2mDvCQaJ8FrcCkdelSylHh6BoA==
X-Google-Smtp-Source: AGs4zManJZMSA3eMo7pHvLhblx/nXTxMLuiE0gbYP5Yiy5f2V08B+3B2PMrthiwRSFx94C/HSZVGr15u7zMUcErZAxI=
X-Received: by 10.223.171.161 with SMTP id s30mr6600555wrc.194.1510572415080; 
	Mon, 13 Nov 2017 03:26:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 13 Nov 2017 03:26:34 -0800 (PST)
In-Reply-To: <49151b79-7ec4-b728-1ea9-d5c393a5bada@amsat.org>
References: <1510087611-1851-1-git-send-email-cota@braap.org>
	<49151b79-7ec4-b728-1ea9-d5c393a5bada@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Nov 2017 11:26:34 +0000
Message-ID: <CAFEAcA-pwxfR-+XSu+q117Po=Lh2aRDGtW9jNAEZuPZNjbFC_Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "Emilio G. Cota" <cota@braap.org>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::232
Subject: Re: [Qemu-trivial] [Qemu-arm] [PATCH] arm/translate-a64: mark path
 as unreachable to eliminate warning
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Nov 2017 11:26:58 -0000

On 8 November 2017 at 12:37, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> On 11/07/2017 05:46 PM, Emilio G. Cota wrote:
>> Fixes the following warning when compiling with gcc 5.4.0 with -O1
>> optimizations and --enable-debug:
>>
>> target/arm/translate-a64.c: In function =E2=80=98aarch64_tr_translate_in=
sn=E2=80=99:
>> target/arm/translate-a64.c:2361:8: error: =E2=80=98post_index=E2=80=99 m=
ay be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>>      if (!post_index) {
>>         ^
>> target/arm/translate-a64.c:2307:10: note: =E2=80=98post_index=E2=80=99 w=
as declared here
>>      bool post_index;
>>           ^
>> target/arm/translate-a64.c:2386:8: error: =E2=80=98writeback=E2=80=99 ma=
y be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>>      if (writeback) {
>>         ^
>> target/arm/translate-a64.c:2308:10: note: =E2=80=98writeback=E2=80=99 wa=
s declared here
>>      bool writeback;
>>           ^
>>
>> Note that idx comes from selecting 2 bits, and therefore its value
>> can be at most 3.
>>
>> Signed-off-by: Emilio G. Cota <cota@braap.org>

Applied to target-arm.next, thanks. (It's a bit sad that
gcc can't figure out that the result of x & 3 is constrained
to [0,3], but there you go.)

> Acked-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

By the way, Philippe, what are you intending to convey with
an acked-by tag? Usually "acked-by" means "I'm the maintainer
for this area and I haven't actually reviewed this but I don't
object to it"...

thanks
-- PMM

