Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEk8u-0004zm-G4
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2013 14:06:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1VEk8n-0004r2-Fk
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 14:06:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1VEk8i-0002H1-Mt
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 14:06:49 -0400
Received: from mail-yh0-x231.google.com ([2607:f8b0:4002:c01::231]:45900)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1VEk8Y-0002Fv-TH; Wed, 28 Aug 2013 14:06:34 -0400
Received: by mail-yh0-f49.google.com with SMTP id v1so1690300yhn.8
	for <multiple recipients>; Wed, 28 Aug 2013 11:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=GV/LWD/OoEreMl21Z6vrDpjm5Iwe/lLj13Bk1cOlXzY=;
	b=woTYjmecy8qKi+I97e7Li11BPcLxtKZvYlxlXTap7OEWVJ8GRmBKBrVgqnUZSW1Wqf
	WMdED0FgpktgG/i+8+TDmdZDOSm8Q/Lp6xtHrYGRG/9FLh+gp/dcVOtEdqdAKuLe+aB8
	VMvg3JCytuxWOl26nlmUhAF8BIHmclX9wU/SbykC+hLC9LV8vvgEAQicZRYOdXz/Uy7F
	BTPt2/GIXUSkv0deJb6gbHrvy3Rd6WInRTxXztoXC1mYeJWvQXaWp0YwzM5oV+4f3RE9
	UwG8+LbdQuYaC2UwEiyP3I09YdrS5QNDZ76QjDCK8MIQ/tZPadj0DbYpciwWjWw8AVm3
	khXA==
X-Received: by 10.236.154.197 with SMTP id h45mr26372180yhk.22.1377713194359; 
	Wed, 28 Aug 2013 11:06:34 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id
	t22sm21733741yhd.19.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 11:06:33 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <521E3C25.6090602@twiddle.net>
Date: Wed, 28 Aug 2013 11:06:29 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1377710886-25198-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1377710886-25198-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c01::231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] tci: Remove function tcg_out64 (fix
	broken build)
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
X-List-Received-Date: Wed, 28 Aug 2013 18:06:54 -0000

On 08/28/2013 10:28 AM, Stefan Weil wrote:
> Commit ac26eb69a311396668809eadbf7ff4e623447d4c added tcg_out64 to tcg/tcg.c.
> tcg/tci/tcg-target.c already had a nearly identical implementation which is
> now removed to fix a compiler error.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Oops, yes.

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

