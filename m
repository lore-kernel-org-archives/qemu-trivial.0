Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6zAz-0006mA-EU
	for mharc-qemu-trivial@gnu.org; Tue, 24 Oct 2017 09:23:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6zAv-0006jo-UN
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 09:23:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6zAs-0002nU-5v
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 09:23:21 -0400
Received: from mail-qt0-x22c.google.com ([2607:f8b0:400d:c0d::22c]:44529)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6zAs-0002nG-14; Tue, 24 Oct 2017 09:23:18 -0400
Received: by mail-qt0-x22c.google.com with SMTP id 8so30374490qtv.1;
	Tue, 24 Oct 2017 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Y8VzmJdhl3JLBd9aK8RJhffYJhAmKFwtg63fj6nB4lA=;
	b=bf29jdKmb2eS+qFB96LsQeoeW4isuCwfKMXzqxKDn5zYflqvhSl45q4JPpEy/ehrya
	19GuDJ9HiUUOv+k5DIOrWhdppX0Dk9o5zhMA9DXQF0s1QMpYKQG/o3E+6fMBPOqGF7fe
	4lt57+nIxI+tswZBe18xqFSSmsq1nrDCxwdYrSg1GBWeIKlpAMA3fXQHpVUYo4tPodVB
	pl/VLFgw4mxVyJCrMemJInJqi+RvdW9VnjZ9eegh1l81dmsVS3Vy8yAz5PkW355XGkXV
	Ud/MKAO4iaN9kmGP4qInx1RQ27IpCi61/xG4sf4RhcM1OeymIPCp5b0yjkaRLvqnSPnm
	K3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Y8VzmJdhl3JLBd9aK8RJhffYJhAmKFwtg63fj6nB4lA=;
	b=h2Q06llMDLV0rxZRgOUNr70YQtDHzn+I8xgGgrlbYkA7BwoSWOQlrHgAzZGgMvkBXg
	eST3WW4vVwVk9XM9lhUwMn3xYfXZH9p2QaeDF/RkEQl/pHo+cUfDa4Ip6ntfPkQtNiIs
	grqXDTS9fHi+ayRNbqTZjf9PdfcuwmDZh3oKq/R4bxznZgxguzZ/dxFchxcnZvLlkA6b
	YiIsndEq9gzAVRzODP7pP6y3JiPV5OjRFWHGH0WAFoJ7DAT6BmMrtxg+6NqcPUZQS6wk
	deUU35GqRyDkJ3lpgWR+LwtTv8MqvST1FMj0RTqVobGyTOQmjnQleMNP/tdLiNlCjUg5
	FlFw==
X-Gm-Message-State: AMCzsaWc9n7cnkno3l1rD8vQsC48j7baK9m4SGUYD7qD6xEFb/7/NuD1
	9PW++v3P3nTNlXEccmTYlnU=
X-Google-Smtp-Source: ABhQp+TsNVptpuuyQEIosQj1iZt9nc2O/BFZ4OTnY4jnDc/jdzGZSnGy1aGUIhEwFFIxXb4+qxtIXA==
X-Received: by 10.200.52.118 with SMTP id v51mr15248172qtb.266.1508851397514; 
	Tue, 24 Oct 2017 06:23:17 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id a26sm224957qta.50.2017.10.24.06.23.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Oct 2017 06:23:16 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Amarnath Valluri <amarnath.valluri@intel.com>,
	Juan Quintela <quintela@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, 
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Peter Xu <peterx@redhat.com>
References: <20171024122045.30072-1-f4bug@amsat.org>
	<20171024123913.GB2787@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <e1b90ef1-33dc-41d5-2aea-405385f02b4b@amsat.org>
Date: Tue, 24 Oct 2017 10:23:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171024123913.GB2787@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22c
Subject: Re: [Qemu-trivial] [PATCH v2 0/4] tpm: add stubs to fix compiling
 with --disable-tpm
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
X-List-Received-Date: Tue, 24 Oct 2017 13:23:23 -0000

>> v2:
>> - added Richard W.M. Jones Tested-by tag
>> - remove #ifdef CONFIG_TPM in tpm.c (Stefan Berger)
> 
> Can confirm v2 works as well.

Thanks for testing!

