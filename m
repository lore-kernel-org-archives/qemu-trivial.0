Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1ejG-0008F7-Gp
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 10:37:50 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1ejB-0008DS-7w
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 10:37:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1ej9-0005h4-6L
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 10:37:45 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:48844)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1ej9-0005h0-02
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 10:37:43 -0400
Received: by wgbfm10 with SMTP id fm10so1169472wgb.10
	for <qemu-trivial@nongnu.org>; Wed, 15 Aug 2012 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=2QI+GpAzPfywqwQ4WYTFIFswrSy4hJwMPHN05rVIdIc=;
	b=RKXU0/FaiuyMkWtbGrRhsES8gkbS31L4yJ2k0fiQC5LEC9AUBFP6x+FGDv2dXAumOO
	kvKM6dFiNOHqlJIxAVdi0Fa15BaDofVlzFvxBDoLZXc27deh9HolQLKdIxjzWzePCqVz
	tENf7WOuw9XKf4J9h8nBAADFXs1YmOgF4P4huy1BucJaO7+2Kh8fVCyfE0gpx+bncs8C
	Vr5A5QVrvqemQNhF6kG41U+gSVA1fx/nBL47izWjA0J4d2AKjQWJwAUlAcsHLRTH5ViD
	Bbpwzr7nSThTKiMIWQXPAZ870nB9PBrueQW/ai9ZGFE0PT2S8IKzNRjS4paWvYB7QUzh
	/Xag==
Received: by 10.180.85.167 with SMTP id i7mr37539639wiz.8.1345041462176;
	Wed, 15 Aug 2012 07:37:42 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id z11sm5030916wiv.10.2012.08.15.07.37.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 07:37:41 -0700 (PDT)
Date: Wed, 15 Aug 2012 15:37:38 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alberto Garcia <agarcia@igalia.com>
Message-ID: <20120815143738.GA16973@stefanha-thinkpad.localdomain>
References: <1344944488-27075-1-git-send-email-agarcia@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1344944488-27075-1-git-send-email-agarcia@igalia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] ivshmem,
 qdev-monitor: fix order of qerror parameters
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
X-List-Received-Date: Wed, 15 Aug 2012 14:37:49 -0000

On Tue, Aug 14, 2012 at 02:41:28PM +0300, Alberto Garcia wrote:
> Now that the QERR_ macros no longer contain a json dictionary,
> the order of some parameters needs to be fixed for them to appear
> correctly.
> ---
>  hw/ivshmem.c      |    3 ++-
>  hw/qdev-monitor.c |    2 +-
>  2 ficheiros modificados, 3 adições(+), 2 eliminados(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

