Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoTsr-0006L3-99
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 03:29:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UoTT4-0007zX-Rm
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 03:03:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UoTT3-00016y-Il
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 03:03:10 -0400
Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229]:56653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UoTT3-00013D-Cz; Mon, 17 Jun 2013 03:03:09 -0400
Received: by mail-wg0-f41.google.com with SMTP id y10so1149842wgg.0
	for <multiple recipients>; Mon, 17 Jun 2013 00:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=OB3Jm1ZRf+1OKo8r+NQIhye5ZRzXUZhagfrYyji61CU=;
	b=NgeMCqKMyiLXktx+9IHCplvmG5PP76j/QsIdf0MSYFrbCHBJBOz6Kp+Cxep6SYwA1h
	dyUS/78Onj0JTql+c1iQ5jE6vnCWmLGMoYVnoeKgFdoG2k5t48uI0LF9MABl1mFPS7A0
	k0XREXmyeILB3U3MCkvaWdD/I0ku5KNM2jLRqrO4cd+XPjZyZHAv1SPEkiWFfh3R1rgl
	STXNbAUqVCicpt2rwPiay1/2xvIdR4zwex9ZOLCdJsNsNhjMAn8xWA4maIJeLnZ/XKZe
	AolAXgHZlkLCRD6KBSCLorHB1gvuXDmaJFV8LaxKZLbXsEdsuTlQTjQb+vnwgfuZE2oO
	DhcQ==
X-Received: by 10.194.48.116 with SMTP id k20mr7300857wjn.23.1371452587961;
	Mon, 17 Jun 2013 00:03:07 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-116-217-184.cust.dsl.vodafone.it. [37.116.217.184])
	by mx.google.com with ESMTPSA id
	fo10sm19865867wib.8.2013.06.17.00.03.05 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 00:03:06 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <51BEB4A7.4000806@redhat.com>
Date: Mon, 17 Jun 2013 09:03:03 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <CAEgEybqrZ50JD5jmf9ge2g1VgNB5XE4wLkfxvB6qBe89vjP8Zw@mail.gmail.com>
	<51BE5EE8.5070607@suse.de>
In-Reply-To: <51BE5EE8.5070607@suse.de>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::229
X-Mailman-Approved-At: Mon, 17 Jun 2013 03:29:47 -0400
Cc: Vladimir Senkov <hangup@gmail.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	qemu-trivial <qemu-trivial@nongnu.org>, qemu-stable@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] copy&paste error in serial.c causes a crash when
 attempting to read from UART (if there is no data to be read)
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
X-List-Received-Date: Mon, 17 Jun 2013 07:03:12 -0000

Il 17/06/2013 02:57, Andreas Färber ha scritto:
>> > From 032bdc94c6369aa7b578182cdad8038ebb2b8cd1 Mon Sep 17 00:00:00 2001
>> > From: Vladimir Senkov <hangup@gmail.com <mailto:hangup@gmail.com>>
>> > Date: Sun, 16 Jun 2013 20:30:52 -0400
>> > Subject: [PATCH] fixed a copy&paste error in serial.c
>> > 
>> > Signed-off-by: Vladimir Senkov <hangup@gmail.com <mailto:hangup@gmail.com>>
> Patch is HTML-damaged unfortunately, we recommend git-send-email:
> http://wiki.qemu.org/Contribute/SubmitAPatch
> 
> But since the patch is so trivial, maybe Peter or Michael can fix it up?

And also add Cc: qemu-stable.

Paolo

