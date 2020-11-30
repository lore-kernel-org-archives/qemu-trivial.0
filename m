Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kjryk-0006gQ-QA
	for mharc-qemu-trivial@gnu.org; Mon, 30 Nov 2020 17:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kjrAd-0001gz-HW
 for qemu-trivial@nongnu.org; Mon, 30 Nov 2020 16:57:19 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kjrAa-0003sN-CL
 for qemu-trivial@nongnu.org; Mon, 30 Nov 2020 16:57:19 -0500
Received: by mail-wr1-x444.google.com with SMTP id r3so18371211wrt.2
 for <qemu-trivial@nongnu.org>; Mon, 30 Nov 2020 13:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=nTM2mj0qOopm26s4brKZwzKdnKbg9EHFY2HIPiFF3N0=;
 b=JNx2V3cJwk6Vt6ifDyaHe3gPb5wyXGUlOkneSAo0xdBVVm2dCDbfUPdGX+fgc26VkG
 4N/84JnzD81PTFAgV9/otsbaxJSCVjaqnvwG64E/vfcqfoITRVSRW8D0hJq64XCULZG/
 l2XUk6bqAoGJfsbWCp+ZOq1Kg3089oXJgCf6HpHEutXZo9T9Hz2M6VJ2P+Bzs1Ibt3h8
 vURgK2W1UiyM7rYC6fyRr01qJPsicfrP8twEBdQWfKfNvjm7NblpJ8HFkrvpInEMUDew
 gb662DGhoWOxY3gM9n1VV0xYb46f/ZFWksWtIKaFrxVhoZKrubckpVVQIQbEc5qn9RQe
 vtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=nTM2mj0qOopm26s4brKZwzKdnKbg9EHFY2HIPiFF3N0=;
 b=WBFFSqUcE7C3K4GhiVYpBZ4K23daJLtDPdxaugjTcr8Pv7Rh82XQViBW3RnUx8kA1J
 XQyolh/K38yz7tpzR0ErSHDXgdg93rS3KWRlRavQnWqMfZ390TgcwpvovQzH6bsDMLCy
 +H0qwdPQVnzHwPf6HwKHiUXF9CDKUe6SXp62ySs8IDF0by5ckYRRkjgxlq1nXXYAWtsg
 uLF5DKbb6OxNZbbBo3StEePJPDpFDtjScUjTbnxrHUUxYw3N9uWc5oMUYhPhOJPvTWLo
 AVOZeUV8UrsZaR7ZE0b2BoGDSqygk7tNDlBKtT8LHg8Y1hOjox++k9+1k+iBJ/hMrFxZ
 vIiA==
X-Gm-Message-State: AOAM53155uwGtgcH+GcYSGOFGgEtIdRf+wWa+46Hj+qtRRh8tuU2z41z
 ZV1ug1tIh83zl1NWBxZgL6EcXA==
X-Google-Smtp-Source: ABdhPJxd14kQMww9GzD2jCoJgiiev9kE2hyL9J5nL1zt/L6iJ5vRD0xMZp2md/DRTPHZoLbUDqp2GA==
X-Received: by 2002:a5d:6783:: with SMTP id v3mr30598819wru.45.1606773434135; 
 Mon, 30 Nov 2020 13:57:14 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id p4sm30224211wrm.51.2020.11.30.13.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 13:57:13 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 307de7b6;
 Mon, 30 Nov 2020 21:57:12 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] qmp-shell: Sort by key when pretty-printing
In-Reply-To: <27cc8383-89e1-5c5f-d8cf-7463810c1fd2@redhat.com>
References: <20201013141414.18398-1-david.edmondson@oracle.com>
 <27cc8383-89e1-5c5f-d8cf-7463810c1fd2@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Mon, 30 Nov 2020 21:57:12 +0000
Message-ID: <cunsg8qjyo7.fsf@zarquon.hh.sledj.net>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::444;
 envelope-from=dme@dme.org; helo=mail-wr1-x444.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 30 Nov 2020 17:49:05 -0500
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
X-List-Received-Date: Mon, 30 Nov 2020 21:57:19 -0000

On Monday, 2020-11-30 at 15:56:51 -05, John Snow wrote:

> On 10/13/20 10:14 AM, David Edmondson wrote:
>> If the user selects pretty-printing (-p) the contents of any
>> dictionaries in the output are sorted by key.
>> 
>> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>> ---
>>   scripts/qmp/qmp-shell | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
>> index c5eef06f3f..b4d06096ab 100755
>> --- a/scripts/qmp/qmp-shell
>> +++ b/scripts/qmp/qmp-shell
>> @@ -260,7 +260,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
>>           indent = None
>>           if self._pretty:
>>               indent = 4
>> -        jsobj = json.dumps(qmp, indent=indent)
>> +        jsobj = json.dumps(qmp, indent=indent, sort_keys=self._pretty)
>>           print(str(jsobj))
>>   
>>       def _execute_cmd(self, cmdline):
>> 
>
> Hi, out of curiosity, what does this help you accomplish?

When dumping a dictionary with many values, visually finding a specific
one that is of interest is much quicker if they are sorted. Nothing more
than that.

> I've recently been overhauling a LOT of the Python utilities we have, so 
> I'm interested in hearing about how people use these tools and what 
> they'd like them to do.
>
> --js

dme.
-- 
I can't explain, you would not understand. This is not how I am.

