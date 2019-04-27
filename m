Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hKQKz-0001Zn-NX
	for mharc-qemu-trivial@gnu.org; Sat, 27 Apr 2019 12:38:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hKQKx-0001C0-OT
	for qemu-trivial@nongnu.org; Sat, 27 Apr 2019 12:38:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hKQAV-00055l-Di
	for qemu-trivial@nongnu.org; Sat, 27 Apr 2019 12:27:16 -0400
Received: from mail-yw1-f50.google.com ([209.85.161.50]:39213)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hKQAV-0004ye-5b; Sat, 27 Apr 2019 12:27:15 -0400
Received: by mail-yw1-f50.google.com with SMTP id x204so2270796ywg.6;
	Sat, 27 Apr 2019 09:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uqoxPsgFwcAEy1xyP9m8aUmcsILjiHBcVsasaxC7RrY=;
	b=NYo4QQ0CpsQKKjB9a6Tvp3c/8ciL9eYFiYFD0btKLCjFoUV7qMENmMle8FNngw7zAj
	qipCmMq+3UTAjAkY60+Gdb/CuSFy9Dri9ZS6yBxprx2SNXTNzi1+97UkMcXZaBJkuOYc
	r2Tn/mjgUAQ7Z9JAbc3zeae61LuOX67xfoKfLYnhMUz2VWplTEUXE2XBb56357SAnqxm
	E1uMHFLn8uQB0snVsxaFGeZ6YzrTQ9pAG3Hh14Sni5V0whYfgAWsScdNDMqUbRISgDbi
	Wxw0deAF3f6O+tt3s24fu4fnHQ1b00xpIfkZ5oYZVqh81wRj855WunxooHGs4VmmZJta
	PPZg==
X-Gm-Message-State: APjAAAXgp2zWjGgQiTfN3DfK4HTpCrLzgkir07sSqytPunyqm97bJBnr
	FiRUUcAFdl+kFhpgTf/KzPkxVMW2AqQCyqR52o0ZavDr
X-Google-Smtp-Source: APXvYqzBKZNoT3lk/JLlaxpyFByjBjqZI7zgCFTikVv3EDy+ZgIp3r8pjJpwHa3AlDjgvR8pO9+/tvbO+DaKAtIIaTQ=
X-Received: by 2002:a0d:d547:: with SMTP id x68mr30755670ywd.356.1556382431231;
	Sat, 27 Apr 2019 09:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190427162429.3617-1-f4bug@amsat.org>
In-Reply-To: <20190427162429.3617-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 27 Apr 2019 18:27:00 +0200
Message-ID: <CAAdtpL5=iiuD4ifCzs_kRE3LTq_u11z2J9qa=K8TpOHvxdBy+A@mail.gmail.com>
To: QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Fabien Chouteau <chouteau@adacore.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.50
Subject: Re: [Qemu-trivial] [PATCH] hw/sparc/leon3: Allow load of uImage
 firmwares
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
X-List-Received-Date: Sat, 27 Apr 2019 16:38:04 -0000

On Sat, Apr 27, 2019 at 6:24 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Grrr sent from wrong computer.

