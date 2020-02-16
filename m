Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3Eeb-0003H1-3d
	for mharc-qemu-trivial@gnu.org; Sun, 16 Feb 2020 02:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j3EeZ-0003Gn-8J
 for qemu-trivial@nongnu.org; Sun, 16 Feb 2020 02:47:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j3EeX-0002XK-Mc
 for qemu-trivial@nongnu.org; Sun, 16 Feb 2020 02:47:46 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39829)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j3EeX-0002Vp-Hh
 for qemu-trivial@nongnu.org; Sun, 16 Feb 2020 02:47:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581839264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUwgwbBLvZ3IwaMIek2pR93LEnsleIFoBlShK/Hp9vM=;
 b=KZFi6e9SOvUX35XrKwV3WIg4GmxsIMokp4+qvXewxS4MCt5zGaVS7CEndE4XenI7ln8Fum
 HLfRqh3q3MMyd9YIhCPztlTmzqWvTBBhDoLCunG2FtHRu7bkhVIXXOupbQDWEe9DJlF8NE
 J7P6rtbfNuGplMu1fvE+vPzC5h0fLd0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-HhkBVL_QMiqwFel8xCga-A-1; Sun, 16 Feb 2020 02:47:42 -0500
Received: by mail-wr1-f69.google.com with SMTP id d8so6900689wrq.12
 for <qemu-trivial@nongnu.org>; Sat, 15 Feb 2020 23:47:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tUwgwbBLvZ3IwaMIek2pR93LEnsleIFoBlShK/Hp9vM=;
 b=Cql5HK4dfWogWWn/mbirPQ6hXruC4sbqHJKjVaorTee4GnYK4yF4DbwLpAD0AQ3ig4
 MP6Cpkh6WpzNOdMclgm3nyP+84dyAIcbZI2a8sa4i3wtM/r30js5q1HQ5DWJAfU66ykR
 /JiolqtXNcl3CH3Aa/O0kSkGho1zKUcVb2UnoGWxaIh5H7A7nas5MgN5MHSM4aw1cl0z
 Z/dt0vin9zhqKMIxx0nM4qlMfBVUkv6FTWllxFAW6Kjg+a0s/fFuziYezsWd4nSLUSjM
 omI7dv/GnIdfK6egzEWgl9B1QM6TCRycsfNIEJZNnRLrXFYt2G0nYgEPynC7t5d3hnBC
 hCMA==
X-Gm-Message-State: APjAAAXjRjaP7Qhs6RTOyQ7LgE7XexKaWwROrKi3eKuYP4WUVaMnyL6E
 /UWED9gaRSS/JgHTXLzHs9E/0yZCGMDtKEbTLQto/TCNN/LLVGwnpTRyu+HSdw/T9mZcyB/5ucb
 +RzZ13BhJ0SuFGkv78A==
X-Received: by 2002:adf:de86:: with SMTP id w6mr15160378wrl.115.1581839261279; 
 Sat, 15 Feb 2020 23:47:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqxwGQnW06CKqjzEAXCU7ZX5GvCHehxlkbzh3pmtkAz+Nq69Rtr9pTwBIYMfOAZGfHQm4SvtxQ==
X-Received: by 2002:adf:de86:: with SMTP id w6mr15160338wrl.115.1581839260937; 
 Sat, 15 Feb 2020 23:47:40 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:ec41:5e57:ff4d:8e51?
 ([2001:b07:6468:f312:ec41:5e57:ff4d:8e51])
 by smtp.gmail.com with ESMTPSA id l2sm14669638wme.1.2020.02.15.23.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Feb 2020 23:47:40 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: Orphan MIPS KVM CPUs
To: James Hogan <jhogan@kernel.org>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe@mathieu-daude.net>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Paul Burton <paulburton@kernel.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20191221155306.49221-1-jhogan@kernel.org>
 <CAAdtpL7CrEAZz5GWJoYCegchQ=-hdkcih07icgoFd-ghJ3nMBw@mail.gmail.com>
 <CAL1e-=jdpp2W-B1cERU4srRQUkPTjewM3hVrndoh4nr-vPSRGA@mail.gmail.com>
 <20200216065717.GA145683@jamesdev>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ba671393-7960-1234-6c40-9a8ce29e108a@redhat.com>
Date: Sun, 16 Feb 2020 08:47:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200216065717.GA145683@jamesdev>
Content-Language: en-US
X-MC-Unique: HhkBVL_QMiqwFel8xCga-A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Feb 2020 07:47:48 -0000

On 16/02/20 07:57, James Hogan wrote:
>> We are in the process of handling this within the company, and this
>> patch should go via MIPS tree, not trivial tree - will be updated when
>> the opinions are crystallized, and all consultations with others were
>> done. There is no rush.
> Hi Aleksandar,
> 
> I respectfully disagree. In the mean time I am still listed as
> maintainer even though this patch has reflected reality for more than 18
> months since the 2018 closure of the MIPS UK offices.
> 
> If "the company" wish to eventually crystalize their opinion and assign
> someone else this role (which they've had at least 6 weeks to do even
> since I sent the patch) they can always submit a new patch.
> 
> In the mean time I'd appreciate if somebody could take the patch ASAP.

I agree with James, the situation has already crystallized long before
the opinions will have.  You have done excellent work on the TCG side,
but neither the kernel nor the QEMU side of KVM have seen any
significant activity.  If your employer becomes more interested in KVM
then the status can be changed.

I think it's okay if we delay the patch a couple weeks more (which is
more or less when Laurent or I will send the next pull request), but
certainly not past 5.0 soft freeze.

Thanks,

Paolo


