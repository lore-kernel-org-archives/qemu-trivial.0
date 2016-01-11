Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIYex-0000vf-Jj
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 04:21:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aIYev-0000vV-Dm
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:21:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aIYer-0001H9-Ce
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:21:05 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:38691)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1aIYer-0001H5-6x; Mon, 11 Jan 2016 04:21:01 -0500
Received: by mail-wm0-x22e.google.com with SMTP id b14so257612968wmb.1;
	Mon, 11 Jan 2016 01:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=KHR4Umv+2J1OvoK0eUaHdRsWKnNnz1qwJN1HfkfrlKs=;
	b=ieShbxtvc1FU35IZx3oOXr0GiCPm5jSwbULfkrB8wkA6fwknMPQvV4JibL0nprNVX8
	Ub+PFP9qCCht3qdNL8cbKydYGIEJFGUc6lN4hV270GtXnHJVY8To9tbibGmIvZ0RhHP/
	eURGoUUpiiAQN8iQsIBOa+0Zf64Mobhx4a0d+Kn2GjcgV1aaQldF5x71m9Nk4olBbomA
	TJAcI2GQijim0q/vRd0t0yWLFfZ6rk7S/s06vX8VnT5dqMAvXBm/g037Lx7GOhtNscW9
	j0/r24J8vqeP3vraPE/4zxqucE29yieis1adtOX6AMm2vrSq5L7we2HPTbSLt+kMaxue
	ewGw==
X-Received: by 10.28.5.213 with SMTP id 204mr11429002wmf.20.1452504060670;
	Mon, 11 Jan 2016 01:21:00 -0800 (PST)
Received: from [192.168.10.165] (94-39-195-126.adsl-ull.clienti.tiscali.it.
	[94.39.195.126]) by smtp.googlemail.com with ESMTPSA id
	ei9sm10909960wjd.40.2016.01.11.01.20.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 01:20:59 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>, Cao jin <caoj.fnst@cn.fujitsu.com>,
	qemu-devel@nongnu.org
References: <1448091903-14460-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<5693688A.9030201@msgid.tls.msk.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <569373FB.7080505@redhat.com>
Date: Mon, 11 Jan 2016 10:20:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <5693688A.9030201@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] PCI: add param check for api
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
X-List-Received-Date: Mon, 11 Jan 2016 09:21:06 -0000



On 11/01/2016 09:32, Michael Tokarev wrote:
>> >  
>> > +    assert(size > 0);
>> > +    assert(offset >= PCI_CONFIG_HEADER_SIZE || !offset);
>> > +
> I'd like to see some ACKs/Reviews for this one, in particular why
> size should be != 0.

In fact it should be >= 2, because two bytes are always written below:

    config = pdev->config + offset;
    config[PCI_CAP_LIST_ID] = cap_id;
    config[PCI_CAP_LIST_NEXT] = pdev->config[PCI_CAPABILITY_LIST];

> Also either move offset assert to the below
> "else" clause or rewrite it to be offset == 0 instead if !offset :)

Good idea to move it below, or even to add

    assert(offset >= PCI_CONFIG_HEADER_SIZE);

after the "if", before the "config" assignment.

Paolo

