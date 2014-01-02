Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VydSn-0005GN-Bs
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jan 2014 03:17:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VydSd-000547-S3
	for qemu-trivial@nongnu.org; Thu, 02 Jan 2014 03:17:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VydSW-0000pI-Ib
	for qemu-trivial@nongnu.org; Thu, 02 Jan 2014 03:16:59 -0500
Received: from mail-ee0-f54.google.com ([74.125.83.54]:50213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1VydSH-0000ZP-OJ; Thu, 02 Jan 2014 03:16:37 -0500
Received: by mail-ee0-f54.google.com with SMTP id e51so5217200eek.41
	for <multiple recipients>; Thu, 02 Jan 2014 00:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=4A6jZCejNv8S9aMFH34f/HknZum0MY7F/WuEafRzihc=;
	b=gh1kKaNlkFX+1MJ4DXx/15SGNxd3x9aLbb8ruVQGU+yoyZ7cBmLrFIQEFbyot7au/W
	u5vUB8tiUpCMdrY1EAAvq0RKhVXow9sALOlKlT52sUbBPCpf7hF6sWgYBGr74aeQpuq4
	/HlrHcseWvA1sVBZpdzHyE6O9k9FVCIrIwRDLgWwF9NleXA5AAmH22WL1nNuk+P6PRuw
	U2ELIqFH3nqgr05z8fbcFz8LJrZT4/DIehl2ZE2sfhMv7nHmdOsAQH6AGnu4fZWb4Uax
	IpseOoENI1TrWOa8BTEqfoltP77XE6KH8zSTlqMwRxeq1ML7tL3D0NM8kU0YgGygWw3X
	ztYA==
X-Received: by 10.14.208.199 with SMTP id q47mr14301909eeo.77.1388650561473;
	Thu, 02 Jan 2014 00:16:01 -0800 (PST)
Received: from yakj.usersys.redhat.com
	(net-37-117-131-111.cust.dsl.vodafone.it. [37.117.131.111])
	by mx.google.com with ESMTPSA id
	p45sm133838739eeg.1.2014.01.02.00.15.58 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 02 Jan 2014 00:15:59 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <52C5203F.1030408@redhat.com>
Date: Thu, 02 Jan 2014 09:15:59 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: Kewei Yu <keweihk@gmail.com>
References: <1388464944-26911-1-git-send-email-keweihk@gmail.com>
In-Reply-To: <1388464944-26911-1-git-send-email-keweihk@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.83.54
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2 1/1] qtest: Fix the bug about
 disabling vnc causes "make check" hang
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
X-List-Received-Date: Thu, 02 Jan 2014 08:17:07 -0000

Il 31/12/2013 05:42, Kewei Yu ha scritto:
> When we disabling vnc from "./configure", the qemu can't use the vnc option.
> So qtest can't use the "vnc -none ", otherwise "make check" will hang.
> 
> Signed-off-by: Kewei Yu <keweihk@gmail.com>
> ---
>  v2: Consolidate VNC macro's #ifdef'ery to one central point (tests/libqtest.c).

What happens if qtest instead uses "-display none"?

Paolo

