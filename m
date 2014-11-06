Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XmQhu-0003my-3F
	for mharc-qemu-trivial@gnu.org; Thu, 06 Nov 2014 12:18:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1XmQhs-0003jr-GI
	for qemu-trivial@nongnu.org; Thu, 06 Nov 2014 12:18:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1XmQhr-0003dx-Ll
	for qemu-trivial@nongnu.org; Thu, 06 Nov 2014 12:18:48 -0500
Received: from mel.v6.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:37645
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1XmQhp-0003cd-8S; Thu, 06 Nov 2014 12:18:45 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 6E5232B3F608;
	Thu,  6 Nov 2014 18:18:44 +0100 (CET)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2klWxam6M23; Thu,  6 Nov 2014 18:18:44 +0100 (CET)
Received: from [10.10.1.115] (lanoue.act-europe.fr [10.10.1.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 5F30E2B3F5FF;
	Thu,  6 Nov 2014 18:18:44 +0100 (CET)
Message-ID: <545BAD74.8020706@adacore.com>
Date: Thu, 06 Nov 2014 18:18:44 +0100
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <1415291030-15485-1-git-send-email-chouteau@adacore.com>
	<545BAD4C.6090006@suse.de>
In-Reply-To: <545BAD4C.6090006@suse.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a02:2ab8:224:1::a0a:d2
Subject: Re: [Qemu-trivial] [PATCH] target-ppc: Fix breakpoint registers for
	e300
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
X-List-Received-Date: Thu, 06 Nov 2014 17:18:49 -0000

On 11/06/2014 06:18 PM, Alexander Graf wrote:
> 
> 
> On 06.11.14 17:23, Fabien Chouteau wrote:
>> In the previous patch, the registers were added to init_proc_G2LE
>> instead of init_proc_e300.
>>
>> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
> 
> Thanks, applied to ppc-next (for 2.2).
> 

Thank you,


