Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAi4r-0000yr-L6
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2012 09:29:17 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1SAi4l-0000bm-3P
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2012 09:29:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1SAi4e-00013P-3d
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2012 09:29:10 -0400
Received: from david.siemens.de ([192.35.17.14]:18787)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1SAi4d-000130-Q7; Thu, 22 Mar 2012 09:29:04 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.13.6/8.13.6) with ESMTP id q2MDT0Ig015060;
	Thu, 22 Mar 2012 14:29:00 +0100
Received: from mchn199C.mchp.siemens.de ([139.22.130.31])
	by mail1.siemens.de (8.13.6/8.13.6) with SMTP id q2MDSxI9023608;
	Thu, 22 Mar 2012 14:28:59 +0100
Message-ID: <4F6B291B.4080200@siemens.com>
Date: Thu, 22 Mar 2012 14:28:59 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1332363767-21327-1-git-send-email-peter.portante@redhat.com>
	<4F6A6CCE.4000904@redhat.com>
In-Reply-To: <4F6A6CCE.4000904@redhat.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.14
Cc: qemu-trivial <qemu-trivial@nongnu.org>, peter.portante@redhat.com,
	qemu-devel <qemu-devel@nongnu.org>
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
X-List-Received-Date: Thu, 22 Mar 2012 13:29:16 -0000

On 2012-03-22 01:05, Paolo Bonzini wrote:
> Il 21/03/2012 22:02, Peter Portante ha scritto:
>> Hi Folks,
>>
>> Please forgive me if you find these changes are annoying, as I am trying to
>> learn the ropes of patch submission with git ahead of making a real patch.
>>
>> While working on the code, I found that scripts/checkpatch.pl will flag lines
>> that I am changing as not adhereing to the codeing standard due to
>> pre-existing coding violations. So I figured I could learn a bit about how to
>> submit patches by fixing these files I will be touching before submitting the
>> code changes.
> 
> I think slirp is a mess and it's not worth doing this kind of sweeping
> change.  Just ignore checkpatch output for slirp.

In fact, I could imagine accepting slirp cleanups provided they come in
palatable pieces and validate that the binary output is unchanged. It's
really a pain changing something in slirp having to use a totally
inconsistent style just to keep the code slightly readable.

Jan

-- 
Siemens AG, Corporate Technology, CT T DE IT 1
Corporate Competence Center Embedded Linux

