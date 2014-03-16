Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPFLx-0003dT-7j
	for mharc-qemu-trivial@gnu.org; Sun, 16 Mar 2014 14:00:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1WPFLp-0003MV-Tr
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 14:00:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1WPFLl-0001ri-3r
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 13:59:57 -0400
Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232]:35288)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1WPFLk-0001rS-Sk; Sun, 16 Mar 2014 13:59:53 -0400
Received: by mail-pa0-f50.google.com with SMTP id kq14so4760893pab.37
	for <multiple recipients>; Sun, 16 Mar 2014 10:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=vIm5wX2g47nA1EplSqc+eQQAJCy7N5C9xc519lNyz/0=;
	b=XjdM+izfT9//ueBRgUdQUjTuCTeXFapGVW3MOgXYYgkbmOuVQftD8J+P9BntdEnY92
	2oe6ZZJekfL0bE+MEbOvByum7kzGstMUI0MKuk7qNHum4X3wRrEjCcMyTsaB9A5mQX2Z
	uMNDJccvaj9b8yZqO2wK7c2uJ5kgp2QGbBeYv7Mr/KtHF8db26c7oAk/MYP6H6vSfeqb
	rR/eG+dmwLiMs4b0VMam11TcKTPEM3ZCKMF1QGp8wc6fSVaQE240NkTTo/TgkMwngdYJ
	itH08WiA0MwhwRg9jTshC++ecGyIf/reUe9JIEpBgmhFq16FahOe9iqkXX2j0idExZDx
	Bx4w==
X-Received: by 10.67.3.40 with SMTP id bt8mr21173666pad.78.1394992791445;
	Sun, 16 Mar 2014 10:59:51 -0700 (PDT)
Received: from pike.twiddle.home
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id
	vg1sm36102887pbc.44.2014.03.16.10.59.48 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Mar 2014 10:59:49 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <5325E691.2060601@twiddle.net>
Date: Sun, 16 Mar 2014 10:59:45 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org
References: <1394977751-18881-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1394977751-18881-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::232
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] target-s390x: Add missing 'static' and
	'const' attributes
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
X-List-Received-Date: Sun, 16 Mar 2014 18:00:03 -0000

On 03/16/2014 06:49 AM, Stefan Weil wrote:
> This fixes warnings from the static code analysis (smatch).
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  target-s390x/arch_dump.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

