Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YR2Cd-0007jW-9V
	for mharc-qemu-trivial@gnu.org; Thu, 26 Feb 2015 12:26:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1YR2CW-0007X8-S1
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 12:26:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1YR2CW-0007px-0h
	for qemu-trivial@nongnu.org; Thu, 26 Feb 2015 12:26:16 -0500
Received: from mel.act-europe.fr ([194.98.77.210]:48558
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1YR2CR-0007ZL-LF; Thu, 26 Feb 2015 12:26:11 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id A10162CEAC8E;
	Thu, 26 Feb 2015 18:26:07 +0100 (CET)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJxANx6dXgn1; Thu, 26 Feb 2015 18:26:07 +0100 (CET)
Received: from [10.10.1.115] (lanoue.act-europe.fr [10.10.1.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 8E9112CEAC2F;
	Thu, 26 Feb 2015 18:26:07 +0100 (CET)
Message-ID: <54EF572E.1080703@adacore.com>
Date: Thu, 26 Feb 2015 18:26:06 +0100
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1424857828-4411-1-git-send-email-chouteau@adacore.com>
	<54EF0E8A.8060701@suse.de>
In-Reply-To: <54EF0E8A.8060701@suse.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Subject: Re: [Qemu-trivial] [PATCH] Openpic: check that cpu id is within the
	number of cpus
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
X-List-Received-Date: Thu, 26 Feb 2015 17:26:22 -0000

On 02/26/2015 01:16 PM, Alexander Graf wrote:
> 
> 
> On 25.02.15 10:50, Fabien Chouteau wrote:
>> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
> 
> Thanks, applied to ppc-next. Next time please include a commit message
> though ;).
> 


Noted.

Thanks Alex,


