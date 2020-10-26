Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kX0Je-0001ac-9Y
	for mharc-qemu-trivial@gnu.org; Mon, 26 Oct 2020 07:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX0Jd-0001Z6-LZ
 for qemu-trivial@nongnu.org; Mon, 26 Oct 2020 07:05:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX0Jb-0003HE-RM
 for qemu-trivial@nongnu.org; Mon, 26 Oct 2020 07:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603710321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yT+2V1CB86GSe5cXLQISnAFcA6eUras1WdS9AparUt4=;
 b=ZdAKkjcCwkxID5VD29XZTmJsZXJsFD194dTvy6GiVRSKzdr3nnV/7PuuKrjn6knICsnb9E
 EfZzCqy1Xzmvv0P88FqFWGTPzFVAtJ7NkpVveC2N6kHy7xFTajKFMeICF6ybjfsMGCn1Yu
 GiWeDW9yhF2EAbw3AsM9uEFh5EFq7Ws=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-y-TD_U-TMf2-EoOEoNUw0A-1; Mon, 26 Oct 2020 07:05:20 -0400
X-MC-Unique: y-TD_U-TMf2-EoOEoNUw0A-1
Received: by mail-wr1-f70.google.com with SMTP id 33so8163841wrf.22
 for <qemu-trivial@nongnu.org>; Mon, 26 Oct 2020 04:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yT+2V1CB86GSe5cXLQISnAFcA6eUras1WdS9AparUt4=;
 b=Sg9JtjJ6se8v5dxGS39GJHScu3FZw4EpZ8tYboUBfuf5bwVJnx7ufQyaEbhWQLdxG0
 WyThl4mhDZgGMzMVLT3lg6O8H89cOUnwhCeZQVAIlVPGXJJ/0NKJ+//nd2FlZydCk8RL
 SICjHdHZ/KGC104m569lDsYNkArMY6aKlhSj3QAokQcSc6zlNJhyASXirKsxR6lYaZCQ
 3PBSc0kqYRS4L1r63bqB4o1jSfjuRX+oOPNqGt9+YgXIJYlHo8m8jzG6Q56tcUJDILra
 hBfTarLEK0+f1XMeB8XZXbQNxKhvBL4Wgc9U2fHWT/JebdQ2zJPOlpR2rWn9idboxElB
 l7aA==
X-Gm-Message-State: AOAM530wW722MPHtPkyhJp/GYUSN8Fx3fWxrxOGqxsCxiEhdBn848zEc
 699MiE9A9phFUCtCf+A3mrzcxCqE9SFIWPjvhI54kl572xmyn1brywFzGMMreGOf3tz35ke1zuz
 fejtKYSj+H+ZT5DeRXw==
X-Received: by 2002:adf:81f4:: with SMTP id 107mr17195403wra.272.1603710318703; 
 Mon, 26 Oct 2020 04:05:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2/verCdp1bFzbsi4AE8ExwU+HjdkKRmIlHmhnYUXC08uHEcdDT+uXD8l06ByFwhrDztVs0g==
X-Received: by 2002:adf:81f4:: with SMTP id 107mr17195382wra.272.1603710318533; 
 Mon, 26 Oct 2020 04:05:18 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q5sm24895430wrs.54.2020.10.26.04.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 04:05:17 -0700 (PDT)
Subject: Re: [PATCH] CHANGELOG: remove disused file
To: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>
References: <20201022162843.1841780-1-jsnow@redhat.com>
 <576a881d-2c64-3e40-31b7-43680a1988f8@redhat.com>
 <22839fc4-a1b9-0510-ff19-3a713fd8a187@redhat.com>
 <88ac9998-51fb-0cca-8b7a-a2204ee0f9b2@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2399870d-d6f8-ba3f-9793-15d42f23e827@redhat.com>
Date: Mon, 26 Oct 2020 12:05:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <88ac9998-51fb-0cca-8b7a-a2204ee0f9b2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:39:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 26 Oct 2020 11:05:30 -0000

On 23/10/20 20:51, Thomas Huth wrote:
> Ok, but IIRC the "ChangeLog" file is a standard file in GNU coding
> conventions, so it might be worth to keep the information in this file ...
> of course we are not bound to the GNU conventions in QEMU, but users still
> might expect to find the information in here...

The contents of the Changelog file would be in NEWS according to the GNU
conventions.  ChangeLog is essentially "git log" output (most GNU
projects in fact generate it from the latter).

Paol


