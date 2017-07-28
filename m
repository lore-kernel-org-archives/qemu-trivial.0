Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db1PW-0003tE-24
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 05:18:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <atar4qemu@gmail.com>) id 1db1PT-0003qq-Sc
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 05:18:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <atar4qemu@gmail.com>) id 1db1PS-0004o0-OT
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 05:18:15 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33414)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <atar4qemu@gmail.com>)
	id 1db1PQ-0004mH-4p; Fri, 28 Jul 2017 05:18:12 -0400
Received: by mail-oi0-x242.google.com with SMTP id e124so16807283oig.0;
	Fri, 28 Jul 2017 02:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nVta+BIXqim3ExkFa2hS1KqwLJ/18ybSxSsiyp/Sals=;
	b=bQOJ0NQrSLEiIb5PrNHHi1elAusxeF2GMcglkKBNhzg+BKns50jWkEsFi2amQWqPjy
	qcT092oFiLgOVx3jOW+rtqLcpR+rIAzGzecE1uNjBsnuQ2pRGaZ4DW4IaOrfPRjPtuwu
	4Pwy2NkFn+sElkReDIealxMSUcoeZfq4VFjaCWBKMatuGAurzrXU/U3kikCV1gMT+YA+
	4f3pn53+dEafy+2knr22MyJkqdqJb46cZ+DC/yewpUn7EoLgNuoPHF7L239y23bBdI0l
	VDdiX84uEi4t9md5S5LUXC85u5M249MQib+KFYG6oSN8xAbF1bE+AN7Q7PmhnTCugDUi
	V29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nVta+BIXqim3ExkFa2hS1KqwLJ/18ybSxSsiyp/Sals=;
	b=L57X+ftpZKSo1Iq1I3rjmXF5OxzvxoIbuB9cJnXEUePb+JJshK+L2qLr+W20gmthCS
	HkFnzegqgx/0tFufc9xNGHCoe4JMxcXITrfk/puoDge7CWDiayGLSujYObiqMPkCFxaf
	52SXzdF6GKoMTOgIbo+NmP6MQUI0ktrrHLwwpYztETHQKJRoeAUbCkEme76A2lMcZHwD
	GgI31wUc6GcloYlN/Db4T7hqTn0CrZs2Fc72NQYQXvGUsODeOHURqrbTu6Jjt6XTqLav
	jpWRjovisfkqTmG90KYQInn0PGSCUSa0NGmCEfUYzQDOOihRUvvhTSPY0rxDjRxxYIN6
	zMIw==
X-Gm-Message-State: AIVw110xKuBuJiiyzFz85COiq6hsPX2k065TiFdLJM/DMac1yug8v1lu
	DAo8NpKQY/roLksMDzr6RL3Y+34w6w==
X-Received: by 10.202.93.2 with SMTP id r2mr6826335oib.193.1501233489730; Fri,
	28 Jul 2017 02:18:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.98.232 with HTTP; Fri, 28 Jul 2017 02:17:49 -0700 (PDT)
In-Reply-To: <20170728053610.15770-31-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-31-f4bug@amsat.org>
From: Artyom Tarasenko <atar4qemu@gmail.com>
Date: Fri, 28 Jul 2017 11:17:49 +0200
Message-ID: <CACXAS8BfLgi5X1rKHDm05RmvE7WMWUtOqQ=roRUtzRQ22yCqmw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-trivial] [PATCH 30/47] MAINTAINERS: add missing SPARC
 entry
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
X-List-Received-Date: Fri, 28 Jul 2017 09:18:16 -0000

On Fri, Jul 28, 2017 at 7:35 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-By: Artyom Tarasenko <atar4qemu@gmail.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bb1cb1fc1c..e363a18631 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -245,6 +245,7 @@ F: target/sparc/
>  F: hw/sparc/
>  F: hw/sparc64/
>  F: disas/sparc.c
> +F: default-configs/sparc*-softmmu.mak
>
>  UniCore32
>  M: Guan Xuetao <gxt@mprc.pku.edu.cn>
> --
> 2.13.3
>



--=20
Regards,
Artyom Tarasenko

SPARC and PPC PReP under qemu blog: http://tyom.blogspot.com/search/label/q=
emu

