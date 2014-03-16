Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPFSv-0000QH-0F
	for mharc-qemu-trivial@gnu.org; Sun, 16 Mar 2014 14:07:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1WPFSn-0000PZ-SP
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 14:07:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1WPFSi-0003z7-1j
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 14:07:09 -0400
Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230]:54412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1WPFSh-0003z0-QR; Sun, 16 Mar 2014 14:07:03 -0400
Received: by mail-pd0-f176.google.com with SMTP id r10so4622827pdi.7
	for <multiple recipients>; Sun, 16 Mar 2014 11:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=wLK/UzJnbaFO3FCmRe2mMRl+752/X/DS6IQyAS8XXlQ=;
	b=LyOOnW7mnIpUH2/af4AICO0XEDfO6jnS5qObCgaibkvTsCIfTKQHuyK9nvmjWnnAcM
	tAHNKMUAR9q1zN7fVUL5dEXtGNP8DYlNdFjq1eoGv5vKetjI/kIhZmhK6WnLws7nRJUz
	1YgPpryPAbTbh0NzKSTJa9P+0DMtjJPHJPFrlysak1elLaEu+iZwBFMvgdTlX7c+WQEM
	mjAFJ+4gJSjeWvzpjddpBWr4Z6Px0fNkLhdo6NGEGhnaWNWVYE7WfFyjfiRo5TMZ/9td
	5YTKU/ruQ1razJZSnO0lf09I0svqVIrYdwrivIjhr4Gx5Ma2nhddanr2nPYMd8vdSbkd
	JBdQ==
X-Received: by 10.68.239.10 with SMTP id vo10mr21580470pbc.48.1394993222879;
	Sun, 16 Mar 2014 11:07:02 -0700 (PDT)
Received: from pike.twiddle.home
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id
	my6sm36148677pbc.36.2014.03.16.11.06.59 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Mar 2014 11:07:01 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <5325E841.3080508@twiddle.net>
Date: Sun, 16 Mar 2014 11:06:57 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org
References: <1394992972-23004-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1394992972-23004-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::230
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] util: Add 'static'
 attribute to function implementation
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
X-List-Received-Date: Sun, 16 Mar 2014 18:07:15 -0000

On 03/16/2014 11:02 AM, Stefan Weil wrote:
> 'static' is used in the forward declaration, but not in the implementation.
> Add it there, too.

You might consider reporting this as a bug in the analyzer, since the static in
the forward declaration does apply to the definition.

That said, for style it's usually better to make them match, so,

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

