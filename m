Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3Kai-00073p-6h
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jan 2014 02:08:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1W3JKv-0001hl-AD
	for qemu-trivial@nongnu.org; Wed, 15 Jan 2014 00:48:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1W3JKq-00060G-Q8
	for qemu-trivial@nongnu.org; Wed, 15 Jan 2014 00:48:21 -0500
Received: from mail-qc0-x229.google.com ([2607:f8b0:400d:c01::229]:50571)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1W3JKh-0005z6-Fb; Wed, 15 Jan 2014 00:48:07 -0500
Received: by mail-qc0-f169.google.com with SMTP id w7so597471qcr.28
	for <multiple recipients>; Tue, 14 Jan 2014 21:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=uKhNzyGIGBw3Zk3D6n1FIdcBkzIOjv4X40Hms9cGYFY=;
	b=aJ7JHB/ajZpItNMDlAUBZf7RQus11pUX3aeI2/3N3GxQmZdZ6+dHfugryHOxdSRMxi
	PQv6Y5qsTHjPVnoqUN9lkek0w9BvUCOj+AosT0gHu5ytp2BM63OzfoSC5jX1mYcPs7dN
	jWVjulLJ3xP9e0XCu2OUs2OX5iktMCyGxEKkaF5lCzVqV1rWGISltQ+tfrwa77ywuNMZ
	qsVBcrlok38c3Mhsyn1cjtJY9G0xBPFVcBA3hZev6mn4S3sOwuvejj2/N9GjtLd3Sajn
	VklCeRsuKHqZxYA+Dglcl0ZDL8NAG7kyI2fvvs16yHR5qDVSBn6CTbLY/86JnUuLAmg9
	7qQg==
X-Received: by 10.224.79.13 with SMTP id n13mr646102qak.70.1389764886473;
	Tue, 14 Jan 2014 21:48:06 -0800 (PST)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPSA id v2sm5064531qer.6.2014.01.14.21.48.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 14 Jan 2014 21:48:05 -0800 (PST)
Date: Wed, 15 Jan 2014 15:47:31 +1000
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Message-ID: <20140115054731.GA29496@edvb>
References: <CAFEAcA8DyS8ftustsMmQWGxmhMUNujVN25m+5d6XCPxQVj3d0A@mail.gmail.com>
	<1385538611-8149-1-git-send-email-sebastian.huber@embedded-brains.de>
	<52A20DF6.9070801@twiddle.net>
	<52CC4250.2060107@embedded-brains.de>
	<52D4E188.6080704@embedded-brains.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52D4E188.6080704@embedded-brains.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::229
X-Mailman-Approved-At: Wed, 15 Jan 2014 02:08:42 -0500
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] SPARC: Fix LEON3 power
	down instruction
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
X-List-Received-Date: Wed, 15 Jan 2014 05:48:26 -0000

On Tue, Jan 14, 2014 at 08:04:40AM +0100, Sebastian Huber wrote:
> Hello,
> 
> maybe this patch can be qualified as trivial?

Hi,

I've applied it, thanks.

Cheers,
Edgar

> 
> http://lists.nongnu.org/archive/html/qemu-devel/2013-11/msg03488.html
> 
> On 2014-01-07 19:07, Sebastian Huber wrote:
> >Hello,
> >
> >would somebody mind committing this.
> >
> >On 12/06/2013 06:48 PM, Richard Henderson wrote:
> >>On 11/27/2013 08:50 PM, Sebastian Huber wrote:
> >>>Synchronize the program counter before the power down helper call
> >>>otherwise interrupts will return to the wrong context.
> >>>
> >>>Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
> >>>---
> >>>  target-sparc/translate.c |    1 +
> >>>  1 files changed, 1 insertions(+), 0 deletions(-)
> >>>
> >>>diff --git a/target-sparc/translate.c b/target-sparc/translate.c
> >>>index 05639ef..7481c85 100644
> >>>--- a/target-sparc/translate.c
> >>>+++ b/target-sparc/translate.c
> >>>@@ -3630,6 +3630,7 @@ static void disas_sparc_insn(DisasContext * dc,
> >>>unsigned int insn)
> >>>                                  if ((rd == 0x13) && (dc->def->features &
> >>>
> >>>CPU_FEATURE_POWERDOWN)) {
> >>>                                      /* LEON3 power-down */
> >>>+                                    save_state(dc);
> >>>                                      gen_helper_power_down(cpu_env);
> >>>                                  }
> >>>                                  break;
> >>>
> >>Reviewed-by: Richard Henderson <rth@twiddle.net>
> >>
> >>
> >>r~
> >>
> >
> >
> 
> 
> -- 
> Sebastian Huber, embedded brains GmbH
> 
> Address : Dornierstr. 4, D-82178 Puchheim, Germany
> Phone   : +49 89 189 47 41-16
> Fax     : +49 89 189 47 41-09
> E-Mail  : sebastian.huber@embedded-brains.de
> PGP     : Public key available on request.
> 
> Diese Nachricht ist keine geschäftliche Mitteilung im Sinne des EHUG.
> 

