Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cYhpU-00049B-TK
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2017 18:27:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cYhpS-00047L-Gd
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 18:27:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cYhpR-0001dr-MN
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 18:27:14 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33254)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1cYhpR-0001dl-IC; Tue, 31 Jan 2017 18:27:13 -0500
Received: by mail-qk0-x244.google.com with SMTP id 11so26085509qkl.0;
	Tue, 31 Jan 2017 15:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:subject:to:references:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=sGRL9f5Oq+gdxgcRfHnngX1AGaMOts5cJBrNds4h7Hk=;
	b=QiL2cP7j7pDXOcbuOa4or1fq8BVmyCBhrp+V4a4UOuXumtpetpx2mmzPIc9BUUkSHw
	f7E54MKKFE00CNsBNYR9AybKNmuHdDXsx2totrMhmjwJBH8m9OqOtFTmUNgUCCEN0CYL
	E1XjATicbbIMGnb1C77E+t2gdaUVvmeSklyaqa8qIDaHO3ROOWuvcfh/DbuG5G5w+Dzn
	2zR3zOaVe4rz/fKd+aawoxNWxiSzH2biFiHPUUx9AtCfCo0XdUo5M8OIQ7rAd+8J5U8k
	eA+KFbv1cpIFVNOPM9SlZ8L/QKmvL6/RbXxlhms5AlEEl9enZwn0+tknCsN9I8nxugHW
	17MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:subject:to:references:cc:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=sGRL9f5Oq+gdxgcRfHnngX1AGaMOts5cJBrNds4h7Hk=;
	b=G9CmvMdsnTt7NrHMRxAu2fIOjISRBbJkUxWpU9XbPGcHMqvn8nN0f/T5KSvYyeAdsV
	0lXquqAw9BN165ZDST9a1rnk6LLghXzaMo9JQlgKxr36OBFcwizpq5W1Jg/kUZo2Msq2
	nhLo4h2C0fA4dYgszeV+385S9fgUpGzU0GLoKZkamZ++I794RqWJLNI75Ekq7wGh2ewZ
	ysSjvEbZmPffNx9dgT64vpqpqM6Ckj50mcCPDsfWdZ2VGma0mG+BbYX/85AoxIdz/1lo
	6OCEfCz2YWfIjlxeWbJY6zmpFJosTXdfc+zu8EWcWWzCTVYiALU0jB294DX+lwVwF5R0
	qX5w==
X-Gm-Message-State: AIkVDXIjtxWJJbDpVWaszBjS/sA7trHb9QGn66yJT4Y1IA3S4IuCEQdOyj0t6SpbAis5vA==
X-Received: by 10.55.79.8 with SMTP id d8mr23009479qkb.50.1485905233074;
	Tue, 31 Jan 2017 15:27:13 -0800 (PST)
Received: from [100.72.72.200] ([209.117.102.182])
	by smtp.googlemail.com with ESMTPSA id
	q5sm16788840qtc.36.2017.01.31.15.27.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Jan 2017 15:27:12 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1485879287-12548-1-git-send-email-peter.maydell@linaro.org>
	<87wpdbw2ki.fsf@dusky.pond.sub.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, patches@linaro.org
Message-ID: <157b55c5-2927-5f4e-0c43-820abd75a6d2@redhat.com>
Date: Tue, 31 Jan 2017 18:27:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <87wpdbw2ki.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop QEMU_GNUC_PREREQ()
 checks for gcc older than 4.1
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
X-List-Received-Date: Tue, 31 Jan 2017 23:27:15 -0000



On 31/01/2017 12:40, Markus Armbruster wrote:
>>  
>>  #define QEMU_NORETURN __attribute__ ((__noreturn__))
>>  
>> -#if QEMU_GNUC_PREREQ(3, 4)
>>  #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
>> -#else
>> -#define QEMU_WARN_UNUSED_RESULT
>> -#endif
> Should we inline this macro?
> 
>>  
>> -#if QEMU_GNUC_PREREQ(4, 0)
>>  #define QEMU_SENTINEL __attribute__((sentinel))
>> -#else
>> -#define QEMU_SENTINEL
>> -#endif
> Likewise.

Why, since we don't do that for QEMU_NORETURN, QEMU_PACKED, etc.?

Paolo

