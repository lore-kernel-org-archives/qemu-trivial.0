Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAVXI-0008Ac-55
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 20:05:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1SAVXF-00089e-AO
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 20:05:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1SAVXD-0005Xm-LU
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 20:05:44 -0400
Received: from mail-pz0-f45.google.com ([209.85.210.45]:62479)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1SAVXD-0005Xf-Cv; Wed, 21 Mar 2012 20:05:43 -0400
Received: by dadp14 with SMTP id p14so2672333dad.4
	for <multiple recipients>; Wed, 21 Mar 2012 17:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=H6by7gPjHTy6X1MfKjDqByD9iOvcIzybdlSL4u7aT2A=;
	b=DOA7dVMXPy7QhROMJb36xJMjSKqLH613Kf25O5tD+XKrupM7vHpPyEcv0fdeR1o6Or
	9pFrKHDSEvulBHL3+BHuvTsuGiew4w5TCX/opEZT678DWUbVcHzDroizwMinMAk1eS1i
	jILoTqMAfTVKjqCUMkMm5aro+nCkSSdfO16Z6VmFLFF3/RsMHYO6QTnV9iElrF1oR4Pm
	GSQutQNXwI0COWpE4kXWDYGJZ4z5BugkA6VTBONuSgSSZ5K6bRaUgOWEg8g7BSsWHbzT
	rpM08XWqDvqQP8Bc/XX4dS2H7O+FNVxq1R6rFxb35xfBIvELkYsD7TI2rctbbqbmp5N6
	kd/Q==
Received: by 10.68.221.65 with SMTP id qc1mr15277047pbc.166.1332374740917;
	Wed, 21 Mar 2012 17:05:40 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-182-16.ip50.fastwebnet.it.
	[93.34.182.16])
	by mx.google.com with ESMTPS id u5sm2398716pbu.76.2012.03.21.17.05.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 17:05:39 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4F6A6CCE.4000904@redhat.com>
Date: Thu, 22 Mar 2012 01:05:34 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>, 
	qemu-devel <qemu-devel@nongnu.org>, peter.portante@redhat.com
References: <1332363767-21327-1-git-send-email-peter.portante@redhat.com>
In-Reply-To: <1332363767-21327-1-git-send-email-peter.portante@redhat.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Subject: Re: [Qemu-trivial] [PATCH 0/4] More whitespace and coding style
 clean ups ahead of future changes
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
X-List-Received-Date: Thu, 22 Mar 2012 00:05:46 -0000

Il 21/03/2012 22:02, Peter Portante ha scritto:
> Hi Folks,
> 
> Please forgive me if you find these changes are annoying, as I am trying to
> learn the ropes of patch submission with git ahead of making a real patch.
> 
> While working on the code, I found that scripts/checkpatch.pl will flag lines
> that I am changing as not adhereing to the codeing standard due to
> pre-existing coding violations. So I figured I could learn a bit about how to
> submit patches by fixing these files I will be touching before submitting the
> code changes.

I think slirp is a mess and it's not worth doing this kind of sweeping
change.  Just ignore checkpatch output for slirp.

For the others, the changes are pretty small so they could be doable.
If you want to change them then please also add braces around if statements.

In any case, your patch submission workflow seems to be fine. :P

Paolo

