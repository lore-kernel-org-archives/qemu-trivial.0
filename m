Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dFim9-00073k-PE
	for mharc-qemu-trivial@gnu.org; Tue, 30 May 2017 11:09:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFim7-00073M-Vz
	for qemu-trivial@nongnu.org; Tue, 30 May 2017 11:09:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFim4-00065y-SD
	for qemu-trivial@nongnu.org; Tue, 30 May 2017 11:09:35 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:36209)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFim4-00065k-Mz; Tue, 30 May 2017 11:09:32 -0400
Received: by mail-oi0-x242.google.com with SMTP id w138so16248391oiw.3;
	Tue, 30 May 2017 08:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=tZU3sA8IKLVfb4kMVIUbRLbR/7IryFAGI4vD9NFmdyI=;
	b=Q6imSdZ4goZKoU5yN06IzKBxvsbNp7f82KAy05aHAlF4dAwvEjkaUJgTe87rwv0yN/
	DT83AN1tdUWc30ABfT4zBZCnU3AdXz+sbdIRKsZQYISfJcsv44eCRV4bV3UPsmBA02uV
	84jHGfDLXpF6cRmF0BBRJCcdB6p1Y8dxSTtq7HBvWMk682B0hgyiaiYJFipTkmvLvMuE
	1LVzkXIThWAIl7TCKJXRq0+zLCkU2ls/laAh7DSBVplpCgd8gIaNrdZQ3KDV8gKfk/Tp
	bwjBfjsIgHJj/cGEYbzJ/tMphWlbWKCdd3HpUwYyvUyytOPerWpRB3dJq3dmHHyg1jne
	wM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=tZU3sA8IKLVfb4kMVIUbRLbR/7IryFAGI4vD9NFmdyI=;
	b=BaRfMO+pvosemAPLZbk0IqjywGTwqMQL7nXpKTOraYlncOhKCwlSAVI38ZIa7cIIUs
	f/TfrWmAvvRFCL/MyxBTQBJ1gdiSPu2OSiMvmnPZAdELjKOdNciSFwKK+07tKCgERF12
	qWdkUuo16CDS5oLdEGb6ramFZexh2gg9Qi2O+8wGqYs8lr4pLF2QP/ERLutQ0yT6JWAR
	Ua/RtG3KgJwNRsGV7++6aS/47HeJszSSF6+Q+wxgaWVNpYt00UV0dOwEkYu/Z6HaUaCR
	NRdnkwVzZ5FiWeFeNrQySunT50P3KPuAh8nfrXKxrsGLU1rK/cCnVythmqsP++8qrPKD
	az6w==
X-Gm-Message-State: AODbwcDcdNnpUeSoyDijH5a20kItjR3BUWxhmQISi01OKkmUJ8erDxWq
	TJqQGOqf1/UpuA==
X-Received: by 10.157.12.193 with SMTP id o1mr6502530otd.27.1496156971951;
	Tue, 30 May 2017 08:09:31 -0700 (PDT)
Received: from [192.168.1.107]
	(162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
	by smtp.gmail.com with ESMTPSA id
	q206sm5904471oif.0.2017.05.30.08.09.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 May 2017 08:09:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <149615665491.28067.17765793725374594694.stgit@bahia.lan>
Cc: Cornelia Huck <cornelia.huck@de.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, qemu-trivial@nongnu.org,
	Fam Zheng <famz@redhat.com>, Alexander Graf <agraf@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <118a46f3-4913-a2d2-947e-49cd7235b86a@amsat.org>
Date: Tue, 30 May 2017 12:09:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <149615665491.28067.17765793725374594694.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-trivial] [PATCH] pc-bios/s390-ccw: use STRIP variable in
 Makefile
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
X-List-Received-Date: Tue, 30 May 2017 15:09:37 -0000

On 05/30/2017 12:04 PM, Greg Kurz wrote:
> The docker-run-test-build@debian-s390x-cross target fails with:
>
> strip --strip-unneeded s390-ccw.elf -o s390-ccw.img
> strip: Unable to recognise the format of the input file `s390-ccw.elf'
>
> The configure script defines a STRIP makefile variable whose default
> value is ${cross_prefix}strip. Let's use it.
>
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  pc-bios/s390-ccw/Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
> index 79a46b67356f..7af57dad109c 100644
> --- a/pc-bios/s390-ccw/Makefile
> +++ b/pc-bios/s390-ccw/Makefile
> @@ -22,7 +22,7 @@ s390-ccw.elf: $(OBJECTS)
>  	$(call quiet-command,$(CC) $(LDFLAGS) -o $@ $(OBJECTS),"BUILD","$(TARGET_DIR)$@")
>
>  s390-ccw.img: s390-ccw.elf
> -	$(call quiet-command,strip --strip-unneeded $< -o $@,"STRIP","$(TARGET_DIR)$@")
> +	$(call quiet-command,$(STRIP) --strip-unneeded $< -o $@,"STRIP","$(TARGET_DIR)$@")
>
>  $(OBJECTS): Makefile
>
>
>

