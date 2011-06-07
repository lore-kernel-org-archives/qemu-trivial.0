Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QTwmR-00027z-RX
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2011 09:57:16 -0400
Received: from eggs.gnu.org ([140.186.70.92]:37474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QTwmK-000265-O7
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2011 09:57:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QTwmH-0002vj-TL
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2011 09:57:08 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:51613)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QTwm9-0002oD-CO; Tue, 07 Jun 2011 09:56:57 -0400
Received: by mail-wy0-f173.google.com with SMTP id 42so4131048wyb.4
	for <multiple recipients>; Tue, 07 Jun 2011 06:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=OR0n0yCj1L4hiaA2tm/z0DIMU1WR4Xb00nnPh1s1abM=;
	b=VBSrx2xoS/DWBD8KPwDdfd6unkXOpnZZ8IDUJtRdCb9g0yWGd3gsF2uhGCFl8jUHnZ
	15Ry/zGoxIhMqCh3wPtXkhA7ktpze44JhNIn16bKYadDcJr3fAZHxG6RDPPZmIt37YVF
	Z7hmD+50R1lV4WmNYgeBG0xUNtIPF7yi79oL0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=bD6N1TUWy2UdZXnfNKvqQQvaz+xgayKlkn6Qo4HNt4CfZTZBuEOrxzompYd9as0L6/
	+LOGYpJp7srdTtwpjDHL6Hv1IB1/YIvdGh6sGCoD71wmwIiGOrUwY9gYJWFhsI1z8uRH
	7/EWmskfrP8BuITFxYwroBc/pWrkVeHLKNORM=
Received: by 10.227.54.195 with SMTP id r3mr3413185wbg.11.1307455015595;
	Tue, 07 Jun 2011 06:56:55 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice2n1.emea.ibm.com [195.212.29.75])
	by mx.google.com with ESMTPS id b10sm3574806wbh.60.2011.06.07.06.56.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 06:56:54 -0700 (PDT)
Date: Tue, 7 Jun 2011 14:56:51 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Martin Simmons <martin@lispworks.com>
Message-ID: <20110607135651.GD1493@stefanha-thinkpad.localdomain>
References: <201106061449.p56EnHo1021674@carson.cam.lispworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201106061449.p56EnHo1021674@carson.cam.lispworks.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Make x86 mfence and lfence
 illegal without SSE2
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
X-List-Received-Date: Tue, 07 Jun 2011 13:57:14 -0000

On Mon, Jun 06, 2011 at 03:49:17PM +0100, Martin Simmons wrote:
> Hi,
> 
> While trying to use qemu -cpu pentium3 to test for incorrect uses of certain
> SSE2 instructions, I found that QEMU allowed the mfence and lfence
> instructions to be executed even though Pentium 3 doesn't support them.
> 
> According to the processor specs (and experience on a real Pentium 3), these
> instructions are only available with SSE2, but QEMU is checking for SSE.  The
> check for the related sfence instruction is correct (it works with SSE).
> 
> This trival patch fixes the test:
> 
> Signed-off-by: Martin Simmons <martin@lispworks.com>

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

