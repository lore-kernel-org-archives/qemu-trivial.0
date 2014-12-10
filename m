Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XydyR-0007Ry-92
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 04:54:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XydyF-0007Co-8e
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:54:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Xydy6-0008DF-7Q
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:54:11 -0500
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235]:56676)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Xydxn-00082D-Ra; Wed, 10 Dec 2014 04:53:43 -0500
Received: by mail-wi0-f181.google.com with SMTP id r20so4500276wiv.14
	for <multiple recipients>; Wed, 10 Dec 2014 01:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=W4N9F1VwAlsqEMS0RebrZNGOS1etoOjiaSayP/ueQAs=;
	b=ZRIo66uJNblkVWEUDMIIbhRAcaIgQ9vDaT/njxiXFWFX2sd3B7yq5vtMNNBDIxrPwv
	2ZVktaEADeHA20DGH3USR/h7G8JycmXN9zhF6BgRTgDWF5XRCf6r50F/xUyvFSXxtNXS
	/QK+jnB6A7B4Cvfz0JXCMk2e9H0kY8QSuVya86np5iJ0ZOCkxQiqKJ6otxL2klWJgb3k
	JWruf+jcDEGtoUR4nVfeTQORuvxlcuDru5vpd9TSnoI+OCtnsSEt3CJr0V8sX3n18WKV
	BAukWhuaJFNoaJGUGuw5TijHf590ITg6jeU21x2pWF57WOQ7ro4k6nOtzSqUFURNH9zz
	Fpiw==
X-Received: by 10.194.201.137 with SMTP id ka9mr5250880wjc.66.1418205223145;
	Wed, 10 Dec 2014 01:53:43 -0800 (PST)
Received: from [192.168.10.150] (net-2-35-193-40.cust.vodafonedsl.it.
	[2.35.193.40])
	by mx.google.com with ESMTPSA id ep6sm5647613wib.0.2014.12.10.01.53.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 01:53:42 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54881823.6030202@redhat.com>
Date: Wed, 10 Dec 2014 10:53:39 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: Michael Tokarev <mjt@tls.msk.ru>, 
	zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org
References: <1418109359-2364-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<54880B00.3030108@msgid.tls.msk.ru>
In-Reply-To: <54880B00.3030108@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::235
Cc: sw@weilnetz.de, peter.huangpeng@huawei.com, armbru@redhat.com,
	afaerber@suse.de, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] vt82c686: fix coverity warning about
 out-of-bounds write
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
X-List-Received-Date: Wed, 10 Dec 2014 09:54:20 -0000



On 10/12/2014 09:57, Michael Tokarev wrote:
> 09.12.2014 10:15, zhanghailiang wrote:
>> Refactor superio_ioport_writeb to fix the out of bounds write warning.
> 
> Is it just a warning, or real oob write?
> From the code it looks like it's just a warning...
> 
> []
>> +
>> +        }
>> +        if (can_write == true) {
> 
> 09.12.2014 17:08, Paolo Bonzini wrote:
>> Michael, can you remove "== true" when applying this patch?
> 
> Sure, just did.  Does it mean I can add your R-b too? ;)

Yes, please do.

Paolo

