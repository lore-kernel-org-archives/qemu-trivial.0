Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1esvMV-0004o4-G4
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2018 14:01:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esvMS-0004mm-Cz
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 14:01:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esvMR-0008AR-GQ
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2018 14:01:24 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:54768)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esvMK-00084h-CA; Mon, 05 Mar 2018 14:01:16 -0500
Received: by mail-wm0-x22d.google.com with SMTP id z81so18023459wmb.4;
	Mon, 05 Mar 2018 11:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4uag5knolMNI9/SSE9YG+JFW2q6UthfNRZtlecy9r6M=;
	b=fPZG0wJMgsKaWFo+KrxMWuHntvUdGarFlTjFAEHgUhzxO2r+AORsxlYv30wU1YTypM
	lo+fmJyg+EzsiK1BfBkSLnXCjc05jsyfbZUv6oOpzauxzTman0oxEFQvO8B19yU4V4qO
	tW3bZ/KKP3FBdF5bAMcR500tlIoL8xe97TBbXf6KOez5o1+wgq0XUtRuw/IFXtA/lmA2
	ogn3IVKcJ+SLE+CGFj1VCd17O3td+GbBXR1rKRyjYGsOOtEuWDx0xeYm3Kf1MfCTUqRT
	BTWmrPSncsjXtruKRas4XeSnOWyBjUckN/RAkoCpN7+7R01Degr3h/GdYoUevP1Znpn3
	GU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=4uag5knolMNI9/SSE9YG+JFW2q6UthfNRZtlecy9r6M=;
	b=nEUkFVKRdg5W/K6j63sVtcB6b9xQpNyvIM4UUhk28FX+pijJanx49Pg3oa5Vonnx6Z
	8ern71glk/IYWdb7ePOhoJ8HnIj9TzQ3Uhj4oyZGGyjwG+s0BQ1LDNcGKF214RkcRlYE
	lIif04uqANW0vAw8m+H5KWiWwcB5tR+ycv7eJ/oZg4fh7Jm0U1lk+5DhTuY4ZJIgLAub
	dXTG6Rco62Or/wyqoEW/RC3eICvYjkIAAi8uu59mYEgJP94dyZ7/iLsYW/qCu0NUj0Mn
	3eZ5ENzkJ5OB/i2vUb6I3qaNkcnZLohkhTL0Y4To5OYO1GWQW4Z15iWCNjrDRbAVH8zV
	Zk7Q==
X-Gm-Message-State: AElRT7EFjUvEJFyR/2uLOE09Oha3XrlaDQRi9H31bTL4Bd0wPDRr+o7Q
	5wAm2vBRAUBBM1IXy0iMefA=
X-Google-Smtp-Source: AG47ELtis2SArXvUa+4CB78rfYMl3RjoEbjLNQc7p8UHdcD7i35im5tYuj9Lr2ZJ+KpzZU42fgYziQ==
X-Received: by 10.28.235.4 with SMTP id j4mr9767277wmh.52.1520276475086;
	Mon, 05 Mar 2018 11:01:15 -0800 (PST)
Received: from [192.168.1.16] (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	n23sm8075707wra.14.2018.03.05.11.01.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 11:01:14 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	Michael Walle <michael@walle.cc>, Yongbok Kim <yongbok.kim@mips.com>,
	Marek Vasut <marex@denx.de>, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
	<hpoussin@reactos.org>, Marcel Apfelbaum <marcel@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, "open list:ARM"
	<qemu-arm@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>,
	Chris Wulff <crwulff@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
	Paul Burton <paul.burton@mips.com>, "open list:New World"
	<qemu-ppc@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
	Gerd Hoffmann <kraxel@redhat.com>
References: <20180305112732.26471-1-f4bug@amsat.org>
	<20180305112732.26471-3-f4bug@amsat.org>
	<20180305185754.GE17368@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d64466e4-57af-ffb7-fb1f-837885e532dd@amsat.org>
Date: Mon, 5 Mar 2018 16:01:12 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180305185754.GE17368@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-trivial] [Qemu-arm] [Qemu-devel] [RFC PATCH v2 02/30] hw:
 include "qemu/cunits.h" and clean unused "qemu/cutils.h"
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
X-List-Received-Date: Mon, 05 Mar 2018 19:01:26 -0000

On 03/05/2018 03:57 PM, Daniel P. Berrangé wrote:
> On Mon, Mar 05, 2018 at 08:27:04AM -0300, Philippe Mathieu-Daudé wrote:
>> These files were including "qemu/cutils.h" to use the byte-based size
>> definitions, now available in "qemu/cunits.h".
> 
> I know I'm "complaining" about bike-shed colour here....
> 
> Feels like just calling it units.h is sufficient - all our .h code is
> C code so don't need reminding of it by filename, particularly since
> we're avoiding system header clash by using the qemu/ prefix on #includes.

I like your suggestion :)

> 
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Regardless of whether you rename it or not though,
> 
>    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Thanks!

> 
> 
> Regards,
> Daniel
> 

