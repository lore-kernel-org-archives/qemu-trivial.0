Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOvO5-0000IV-2E
	for mharc-qemu-trivial@gnu.org; Sat, 15 Mar 2014 16:40:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1WOvNx-0008PE-Au
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 16:40:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1WOvNr-0001Xt-B8
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 16:40:49 -0400
Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230]:49131)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1WOvNf-0001VW-AM; Sat, 15 Mar 2014 16:40:31 -0400
Received: by mail-pa0-f48.google.com with SMTP id hz1so4077445pad.21
	for <multiple recipients>; Sat, 15 Mar 2014 13:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=JOVe5xn95O3j2GNa8wZnlI/gOPGR+QOb1Wa9sKgqRnM=;
	b=SFys8uuPRu0cltuE7Le+EY7Dje8YdCZY5BZ+mIsAm/3pMCHnl6MA92XWibBn7bBhNc
	H2QbAnGPdgo7Zf8nlGU7JYDjQHtrdOylxaMbmVgfp+QgSUZk3sFBXUnzj3OlusYoPTF4
	jdg1Dm/73JUjbrta1YIPuqN/Ch9kzKZ13w2Noxefo5uaSstME1o80rzhZ9Ph6zs7JOKQ
	DKq2L+6XOE59iYtzVRB3XRVREX/UNpeBFzh3Lieqf+aH1G3nuI/TfALVYidlw+LGsx4i
	Y8GKzdlB6aiSDC+YEPKaqPmHSv6YEdj0MbbcF5kOFRkM4uyoyX48MWw89zXM5/t/okd9
	WuJw==
X-Received: by 10.68.234.2 with SMTP id ua2mr16608223pbc.81.1394916029458;
	Sat, 15 Mar 2014 13:40:29 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id
	ns7sm28693987pbc.32.2014.03.15.13.40.27 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Mar 2014 13:40:28 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <5324BABA.7090809@twiddle.net>
Date: Sat, 15 Mar 2014 13:40:26 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1394908420-6981-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1394908420-6981-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::230
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-alpha: fix subl and s8subl
	indentation
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
X-List-Received-Date: Sat, 15 Mar 2014 20:40:55 -0000

On 03/15/2014 11:33 AM, Paolo Bonzini wrote:
> Two missing braces, one close and one open, fabulously let the code
> compile.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Wow.  That's ... amazing.

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

