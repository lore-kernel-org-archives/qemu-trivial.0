Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0QbJ-0002cU-QN
	for mharc-qemu-trivial@gnu.org; Wed, 11 May 2016 05:38:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1b0QbF-0002TR-Bf
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 05:38:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1b0QbD-0005Tq-4z
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 05:38:36 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:33890)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1b0Qb6-0005RE-4c; Wed, 11 May 2016 05:38:28 -0400
Received: by mail-wm0-x241.google.com with SMTP id n129so8279378wmn.1;
	Wed, 11 May 2016 02:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=0RddxOSy5osApvo7pN37V6y4bXVEEXf5EG8mfxcRK3s=;
	b=ebvFF3B7SpvXMle91kKZ39vaQsMFlmRE4s0QJ/K+bZ0cXkjMvUwykRLWrPr/Lgl6L5
	vPLf7lXtEff8LYD77Sq2Sm0ofiCRguXHvS7C5UD1au4nmDkyBQ406czceMSqVSKI8LD6
	bOtP4AzgwvxtaBsr5vM00BIrwYGq229VBqL4q9IFR8hWLyvoTy77YPNKd2KCVZHTkEYt
	Swk5JnjIscc/+MOK07IW+1OqCjvTnbDwljbzKs1KIDDxJo/7iGrsatNKh0ozqzF/6U42
	tY5ukdLJMrui1sIgh7WoQjBz1ScJxu4b8Bhhp2VMx1JR/AqZXMjZLk+gy2gHJ0kmvXZo
	W0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=0RddxOSy5osApvo7pN37V6y4bXVEEXf5EG8mfxcRK3s=;
	b=SRWXxttBy9AFbao0pt5FGvumFto5XqdUqjcAtMdzqwZdp3zsTVzhfRCe0SzOsZdO71
	b7hMWmhXnuFzOfORjPvBH1Fm3zRK4KfpsmiTSYAz827GU4JrBLpU1OySO5tFYFz5cPbp
	Z553XTquBox0Y3hh5HJ5jxsIrEevQ79Dzh4SZDB8YDngon3BvEhVkePU4r3Ml/H7FJMM
	0da/8lNAolDVMlxV6OvrXqZPCwykTGHmRiQLRKpxBhYMT8V+NWt3M6DnnXpsu2AuxaFo
	FIPu2nB0M7lf/3d4ICF8QdlPUYtcQENUjATQWJcvSiQkmoZrsmknt8yhqFxgeZVu2d44
	ScqA==
X-Gm-Message-State: AOPr4FXyG116DqD6aABI3OaFAWjrjk8yc2lQxqV95xQzGfMabynp5rM3cHD8BtkZqpazzw==
X-Received: by 10.194.77.140 with SMTP id s12mr2646889wjw.24.1462959507191;
	Wed, 11 May 2016 02:38:27 -0700 (PDT)
Received: from [192.168.10.150] (dynamic-adsl-78-12-252-58.clienti.tiscali.it.
	[78.12.252.58]) by smtp.googlemail.com with ESMTPSA id
	e8sm7543459wma.2.2016.05.11.02.38.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2016 02:38:25 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Alex Bligh <alex@alex.org.uk>,
	Quentin Casasnovas <quentin.casasnovas@oracle.com>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
	<20160510154545.GB28315@chrystal.uk.oracle.com>
	<592DA6FD-75F8-4B7F-AA21-DEA8D591B723@alex.org.uk>
	<20160510160438.GD28315@chrystal.uk.oracle.com>
	<8F0007CD-40E2-43C1-8196-B4BE401B8EF4@alex.org.uk>
Cc: Eric Blake <eblake@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5732FD8C.1080106@redhat.com>
Date: Wed, 11 May 2016 11:38:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <8F0007CD-40E2-43C1-8196-B4BE401B8EF4@alex.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [Nbd] [Qemu-devel] [PATCH] nbd: fix trim/discard
 commands with a length bigger than NBD_MAX_BUFFER_SIZE
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 11 May 2016 09:38:40 -0000



On 10/05/2016 18:23, Alex Bligh wrote:
> > Is there a use case where you'd want to split up a single big TRIM request
> > in smaller ones (as in some hardware would not support it or something)?
> > Even then, it looks like this splitting up would be hardware dependant and
> > better implemented in block device drivers.
> 
> Part of the point of the block size extension is to push such limits to the
> client.
> 
> I could make up use cases (e.g. that performing a multi-gigabyte trim in
> a single threaded server will effectively block all other I/O), but the
> main reason in my book is orthogonality, and the fact the client needs
> to do some breaking up anyway.

That's why SCSI for example has a limit to UNMAP and WRITE SAME requests
(actually it has three limits: number of ranges per unmap, which in NBD
and in SCSI WRITE SAME is 1; number of blocks per unmap descriptor;
number of blocks per WRITE SAME operation).  These limits however are a
different one than the read/write limit, because you want to support
systems where TRIM is much faster than regular I/O (and possibly even
O(1) if trimming something that is already trimmed).

Paolo

