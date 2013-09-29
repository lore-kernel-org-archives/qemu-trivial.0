Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQJjy-0008Im-4m
	for mharc-qemu-trivial@gnu.org; Sun, 29 Sep 2013 12:21:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1VQJjr-0008Au-Dt
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 12:21:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1VQJjm-0004yi-Ji
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 12:20:55 -0400
Received: from mail-pb0-x22c.google.com ([2607:f8b0:400e:c01::22c]:51838)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1VQJjZ-0004rN-RV; Sun, 29 Sep 2013 12:20:38 -0400
Received: by mail-pb0-f44.google.com with SMTP id xa7so4567815pbc.17
	for <multiple recipients>; Sun, 29 Sep 2013 09:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=1mSvJGzdJ7/Fq0ob6wmjWgBRQpZh296k7Zmh4R5x8L8=;
	b=x2U5eIOSKr12JNQQjDjed7Emd+pbzI/dxl7bntfRtWAFKR4vuUtD4hVT/aYY/Y9rll
	mSvnULeHR10FmCivOPyMwDcHKTWAUnjMdZw1pD8Cc1+Vg6ilNrgZshQq/vShVekE5Ua4
	W4PAts14gWeAarpYEmKPb2Sru5XYyvE+uj7Lwp1bowBh5+/ol/zMGiBGjBadh2O808ga
	rD1+RmhgfnNBfPahcW1nGoXV3o0lrJ9Ogb5IxBYsJvw+Fxd34g1+fToDieG3tYVyCVPb
	J5Lbt1/dIzXhuv998sRbGbx2QPtyyCjTfugP3o5+GKJeggLj9zbVw+Ojiph6rvrJHnXe
	BL6Q==
X-Received: by 10.66.216.129 with SMTP id oq1mr23723883pac.75.1380471636099;
	Sun, 29 Sep 2013 09:20:36 -0700 (PDT)
Received: from pebble.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id b3sm21474263pbu.38.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 29 Sep 2013 09:20:35 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <52485350.2030406@twiddle.net>
Date: Sun, 29 Sep 2013 09:20:32 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1380469880-19448-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1380469880-19448-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22c
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/alpha: Fix compiler
 warning (integer constant is too large)
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
X-List-Received-Date: Sun, 29 Sep 2013 16:21:00 -0000

On 09/29/2013 08:51 AM, Stefan Weil wrote:
>>From buildbot default_i386_rhel61:
> 
>   CC    alpha-softmmu/hw/alpha/typhoon.o
> hw/alpha/typhoon.c: In function 'typhoon_translate_iommu':
> hw/alpha/typhoon.c:703: warning: integer constant is too large for 'long' type
> hw/alpha/typhoon.c:703: warning: integer constant is too large for 'long' type
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---

Acked-by: Richard Henderson <rth@twiddle.net>


r~

