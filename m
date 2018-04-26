Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fBgEC-00043x-UA
	for mharc-qemu-trivial@gnu.org; Thu, 26 Apr 2018 08:42:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fBgEA-00043q-Lg
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 08:42:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fBgE5-0004lw-5G
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 08:42:22 -0400
Received: from mail-wr0-f170.google.com ([209.85.128.170]:39122)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1fBgE4-0004lO-UO
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 08:42:17 -0400
Received: by mail-wr0-f170.google.com with SMTP id q3-v6so46632053wrj.6
	for <qemu-trivial@nongnu.org>; Thu, 26 Apr 2018 05:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lbDH9qhuJPTZ+FAKLtlBP7yAzr1boqWR9MgXtqVCGpM=;
	b=RTN5/TwDBG24g0z3ksMhkV0qda6FwuaYeyVtueZSSDfcj39yUTj0nS4sO2NEMGFNaM
	+87xzPTK3uffoqCCE74Mh5Tri+NIOoEgMQIEZdeXROTLJFsFL4aLXBVxIQ89YqpVYmCh
	rHYOCqbyU+btin655tkFFLEw3MxQSMBjGmkd+eJ33zkFQ+r08YlVEIoLwy83P64jIACS
	QrlVFt4x/68MwKxr10P1qXPZaxpDWxKESV1eh0tjU+AN3cQh8n3fHv83b+6Ijr1/jQmK
	zbFh9VzsmEblkh/gLnW5oKMDKsoJoLQSqfPqtCungcT92gXL6Z1nRLZ8koxZHohAAfe7
	X5ww==
X-Gm-Message-State: ALQs6tCHN51QnMfrGe0w+a7Iygs8pRJhzZ0Fqwp62uQFwCcBE6NxXOye
	i/Yge7SK5LIj8PCL13sM5hjr0A==
X-Google-Smtp-Source: AB8JxZqkaW6UCBMRH/PbZiz+nBcmc7XFKedLzDW2kddtOgSqYyf93gFPGQodlZQ95aE5+JA1ahSMMQ==
X-Received: by 2002:adf:b356:: with SMTP id
	k22-v6mr3405240wrd.207.1524746535065; 
	Thu, 26 Apr 2018 05:42:15 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-78-12-189-60.clienti.tiscali.it.
	[78.12.189.60]) by smtp.gmail.com with ESMTPSA id
	b5-v6sm19029101wrf.40.2018.04.26.05.42.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Apr 2018 05:42:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Olaf Hering <olaf@aepfle.de>, =?UTF-8?Q?Daniel_P._Berrang=c3=a9?=
	<berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>
References: <20180418123838.3511-1-olaf@aepfle.de>
	<20180418124753.GM27579@redhat.com>
	<CAFEAcA_TtC-p4JJFRPaBFwim1a8J9G+z79KAK8vqrTx7ZKjOKg@mail.gmail.com>
	<20180418144433.GV27579@redhat.com>
	<CAFEAcA8jXwo35B7KVdVZEiqZTtMRvVXCP87iHKECjWPkHiTJ_A@mail.gmail.com>
	<c9b7c417-e714-658b-20da-7150c9ec8ab9@redhat.com>
	<20180426140807.4a4a577b.olaf@aepfle.de>
	<20180426121002.GG26812@redhat.com>
	<20180426141140.7d7b39d0.olaf@aepfle.de>
	<b976e072-78c5-e12a-ba72-2075b8b635e3@redhat.com>
Message-ID: <79669d21-8f20-dff2-83c3-c3fd95dfe179@redhat.com>
Date: Thu, 26 Apr 2018 14:42:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <b976e072-78c5-e12a-ba72-2075b8b635e3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.170
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] configure: require
 glib-2.24
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
X-List-Received-Date: Thu, 26 Apr 2018 12:42:24 -0000

On 26/04/2018 14:39, Paolo Bonzini wrote:
> On 26/04/2018 14:11, Olaf Hering wrote:
>> Am Thu, 26 Apr 2018 13:10:02 +0100
>> schrieb Daniel P. Berrangé <berrange@redhat.com>:
>>
>>> Presumably the min-glib docker job didn't enable the vfio feature, which
>>> is what contained the bad code.
>>
>> It is Linux=y, every following commit would have failed too.
>> I suggest to revisit that testcase.
> 
> That's because Red Hat backported g_realloc_n into RHEL6 :) probably
> because it's used for security reasons and they expected users to appear
> in the next 10-ish years.
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=573966

Almost.  It's because the g_*alloc_n was introduced in order to fix
overflows in g_*new.  When Red Hat fixed the overflows, that implicitly
added those functions.

Paolo

