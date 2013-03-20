Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UIGcZ-0004fg-9d
	for mharc-qemu-trivial@gnu.org; Wed, 20 Mar 2013 06:51:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UIGcW-0004dl-TW
	for qemu-trivial@nongnu.org; Wed, 20 Mar 2013 06:51:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UIGcU-00063S-6H
	for qemu-trivial@nongnu.org; Wed, 20 Mar 2013 06:51:48 -0400
Received: from mail-we0-x22d.google.com ([2a00:1450:400c:c03::22d]:49918)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UIGcU-000638-15
	for qemu-trivial@nongnu.org; Wed, 20 Mar 2013 06:51:46 -0400
Received: by mail-we0-f173.google.com with SMTP id x51so1198070wey.4
	for <qemu-trivial@nongnu.org>; Wed, 20 Mar 2013 03:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=1YGJ1OnqS7aQtE3ZEum1iETJmlTewwoRgf0ERhWtZaM=;
	b=pL7G6AHHuo9hEt0hT1eNG6hMmnu5nkoXV4VfuGx0d5mVdRkunTGEcsagZ/lUmpkQo5
	/uLBcyBBOSi8Ogrh008KLBdGvHro2MKR+96sniB22GpxnKnV1ZufxiFJxsWjT0MdBKGz
	RbaVkUg7/LWQCZQJ3mfskwEX0BogkXhTRUFOEYf3YspoOtLrBsuzSPhHrQr3Qjr4TuSs
	+QIK5nGx9JhlhscAm/FH0VStTEMYukIr7SA3cgB+ilVFkIrWcqpH8Xk6TFgI1hAV46Or
	F9Z+qluLS/8/Wm48cekjxyHv5bgLowZHAfP1meIdqlKSmGWSViN8h7Jy7SvUIMARbDor
	SMmw==
X-Received: by 10.194.91.211 with SMTP id cg19mr9531051wjb.43.1363776704983;
	Wed, 20 Mar 2013 03:51:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.29.164 with HTTP; Wed, 20 Mar 2013 03:51:24 -0700 (PDT)
In-Reply-To: <20130320034208.GA29514@cs.nctu.edu.tw>
References: <20130320034208.GA29514@cs.nctu.edu.tw>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Mar 2013 10:51:24 +0000
Message-ID: <CAFEAcA8_7dBM7NDvT83aVzijh3pAUgONV1QH_wwEz=g07Em_jw@mail.gmail.com>
To: =?UTF-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQloOAi815aBs4Pn5z5p9jJzGD5InU1FKyvJS2nw8JOTWBq7MTrCVFYb4R5crXFPADigINb2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22d
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v3] Use proper term in TCG README
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2013 10:51:50 -0000

On 20 March 2013 03:42, =E9=99=B3=E9=9F=8B=E4=BB=BB (Wei-Ren Chen) <chenwj@=
iis.sinica.edu.tw> wrote:
>   In TCG, "target" means the host architecture for which TCG generates
> the code. Using "guest" rather than "target" to make the document more
> consistent.
>
> Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

