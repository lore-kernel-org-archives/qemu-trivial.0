Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPajc-0001Vz-3z
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 12:49:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1WPajS-0001TS-3A
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 12:49:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1WPajJ-0008Cd-Fh
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 12:49:46 -0400
Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f]:56989)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1WPajJ-0008BN-95; Mon, 17 Mar 2014 12:49:37 -0400
Received: by mail-pd0-f175.google.com with SMTP id x10so5762457pdj.6
	for <multiple recipients>; Mon, 17 Mar 2014 09:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=aze7VvBSgp1ivlx+Qht2Vvj/WxIf+Azba4tgBaFqD70=;
	b=XRXCZjkcj6QYi/Rph9Jy2Wq09Wu06ovKcszw2+G07duuhIRDkW9HkL1mnYCUqSmFjM
	tGhafi+T3FjsAJfAa1OMuqG33SdtMBRV+pZQUBQIBGwDTe0BvOxxNWCFvqhIxT6YW+P1
	gcdgxKh1/PxBY4+irUu/5gK/hLLPhsD/X7xIcoQzhzlHk4BpzCkKEK9mzyVmsDx26ovO
	7c9WK2RVeDQxC7i5Xxw9X1ov8bc+kgM1rASaY8gq4s+jdO8cPbBRI2PMzCusRD9fLzg+
	GuZDhRue95gFQfReDmu34y33+BKBeaBeBZqGdR2ahqrYjacD2NvbLPKLqHTRnVtCQ6dx
	fK1w==
X-Received: by 10.66.252.135 with SMTP id zs7mr27539566pac.13.1395074975600;
	Mon, 17 Mar 2014 09:49:35 -0700 (PDT)
Received: from pike.twiddle.home
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id
	el14sm74257548pac.31.2014.03.17.09.49.33 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Mar 2014 09:49:34 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <5327279C.9030908@twiddle.net>
Date: Mon, 17 Mar 2014 09:49:32 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org
References: <1394992972-23004-1-git-send-email-sw@weilnetz.de>	<5325E841.3080508@twiddle.net>
	<5325F07C.80004@weilnetz.de>
In-Reply-To: <5325F07C.80004@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22f
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
X-List-Received-Date: Mon, 17 Mar 2014 16:49:54 -0000

On 03/16/2014 11:42 AM, Stefan Weil wrote:
> We have a similar situation with other attributes, too. Smatch also
> complains about missing QEMU_NORETURN in our implementation code (we add
> it only in header files for global functions). Do you think it would be
> good to make header and implementation match there, too?

Not without changing our CODING_STYLE.

I'm not really fond of

void attributes some_function(arg, arg, arg)

since its quite easy to wind up with too long lines.  It's one of the things I
really like about the gnu style

void attributes
some_function(arg, arg, arg)

layout.  (In addition to being an old codger who really liked to be able to do
"grep ^some_function *.c" to find the implementation.)


r~

