Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1agA0d-0004Dv-G5
	for mharc-qemu-trivial@gnu.org; Wed, 16 Mar 2016 07:53:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1agA0b-0004BE-Hy
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 07:53:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1agA0a-0008N3-RX
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 07:53:01 -0400
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:34024)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1agA0V-0008MJ-Q8; Wed, 16 Mar 2016 07:52:55 -0400
Received: by mail-wm0-x229.google.com with SMTP id p65so186146418wmp.1;
	Wed, 16 Mar 2016 04:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=1i6uxk/GUsDxwWnuapkUmjE6yzt6JT20K2KJFKTD2CM=;
	b=V0GxJv5zWAE0vvHSlhJ9teYRVC1jekN3ekjq3H6WvAiDc13HIE10EntxlcFHls48K0
	dmkgUcyIXa5b3aPbiumjRWBTXYVKdM6wLplA4BlW4mQ5IiqittgVx6WTk1NlpF3vZ7uS
	C22yOEu4bVnuWin9N0I7zJfqiCUA+kp/t1UT9LSq+32/3/wCfWlAKSZxg9DyqSgi2Nfv
	nsp0axixYCB69MUvAyQPAvZm3MfHwYN6oxrHeLDQ0E+YBq648l1d8IaV0IstD2hvfClL
	/HSOqMPEShC0CUzOVJgA4AdODZhAMA8ZHr9uOySICwDvjE3Ik63WGzDR4iNFgPl+a4hh
	of3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=1i6uxk/GUsDxwWnuapkUmjE6yzt6JT20K2KJFKTD2CM=;
	b=FSGYwavYMqd7yuR0K9SKKHeEwg4h6ZXh92zYaW7SDSc8enEvs+lGIv201fixmZPwLK
	mY5tEICGIt8xJd2trDSuinyU0h0AHkQ6aHojVJKw2C6oDXbOyxHdVtQ+n4ltN3gGQzNI
	mG07jWPSuKkG/6vWrOulpm1lWWUQ+q0bIFoxVwxfqkAbN+yjbD7cHQRj4Ye+gnKYO1tU
	QEon19F1S/dtAj+vll/tARw/CyOXyrUzFYQaLQXSqMF5mwxiiIxbf06ViEv7OeZ42pVR
	q/ZNDrN3nkduK6lonjvBgNvZ3Iz3UpMjK4sP6jwmN6Yws2NaFJYpI/mhku3BWPNvRtNz
	wILw==
X-Gm-Message-State: AD7BkJKuaB3FwyNdhFbgMq/LDphokzymafnBlpKqGiZ22JWQJIZ+zavzsRWWQ5RNZMOokA==
X-Received: by 10.194.200.194 with SMTP id ju2mr3266058wjc.63.1458129174770;
	Wed, 16 Mar 2016 04:52:54 -0700 (PDT)
Received: from [192.168.10.165] (94-39-161-17.adsl-ull.clienti.tiscali.it.
	[94.39.161.17]) by smtp.googlemail.com with ESMTPSA id
	c71sm3176239wmd.4.2016.03.16.04.52.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2016 04:52:53 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>, Wei Yang <richard.weiyang@gmail.com>,
	alex.williamson@redhat.com
References: <1455152067-19900-1-git-send-email-richard.weiyang@gmail.com>
	<56E9433C.1040503@msgid.tls.msk.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56E94914.1040803@redhat.com>
Date: Wed, 16 Mar 2016 12:52:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56E9433C.1040503@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::229
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vfio/pci: replace 1 with
 PCI_CAP_LIST_NEXT to make code self-explain
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
X-List-Received-Date: Wed, 16 Mar 2016 11:53:02 -0000



On 16/03/2016 12:27, Michael Tokarev wrote:
>> >      for (tmp = pdev->config[PCI_CAPABILITY_LIST]; tmp;
>> > -         tmp = pdev->config[tmp + 1]) {
>> > +         tmp = pdev->config[tmp + PCI_CAP_LIST_NEXT]) {
>> > -    next = pdev->config[pos + 1];
>> > +    next = pdev->config[pos + PCI_CAP_LIST_NEXT];
> Hmm. I'm not sure the new version is better, to me "+1" reads
> easier than the new symbolic constant variant.
> 
> If it were something like pdev->config[PCI_CAP_LIST_NEXT], that'd be
> nice, but not "pos + PCI_CAP_LIST_NEXT".
> 
> But again, I'm not pci config space expert and don't understand
> the basics :)

Each capability is a node of a linked list, and the position of the next
capability is at offset 1 inside the capability (here it is at offset 1
from the tmp or pos base).  I think the patch is an improvement.

Paolo

