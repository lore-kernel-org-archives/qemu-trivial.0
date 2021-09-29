Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVTF0-00079p-6S
	for mharc-qemu-trivial@gnu.org; Wed, 29 Sep 2021 02:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mVTEy-00079Y-8J
 for qemu-trivial@nongnu.org; Wed, 29 Sep 2021 02:38:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mVTEr-0005U8-Dj
 for qemu-trivial@nongnu.org; Wed, 29 Sep 2021 02:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632897521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IohUFWpC7htNTe643FaqWcZ7soDbCX2FDXsb6QdxlIg=;
 b=Js3xJrvZRswiA2joRWyfjIfnFT6I/bEo/ye3fgQnSzfzMv2zyOAOcG9az/bDlammWHuo4Y
 TP6I1WZfCTrQ3V0/M7tG+QjXmvyN4onPz6NNHu9gX2ox3y+BQ8RU3sKpMDL5FdD90M72mI
 BUQ4LaMqu7BTTmoFqwVUSu3qz6tCj0k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-kIY6FiveN62zKf7ERlxwwQ-1; Wed, 29 Sep 2021 02:38:38 -0400
X-MC-Unique: kIY6FiveN62zKf7ERlxwwQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 129-20020a1c1987000000b0030cd1616fbfso2278375wmz.3
 for <qemu-trivial@nongnu.org>; Tue, 28 Sep 2021 23:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IohUFWpC7htNTe643FaqWcZ7soDbCX2FDXsb6QdxlIg=;
 b=vv0OI6HZL/nPXR3rPoa8NEyY8a9wG89MUXcoXq7ZKYxa+ryRhXfuyDCXiMCyQiySuW
 TITJ0tyw7hT9EKCCXTlWK4CFxCZLRwnBknCVVESH5SMLlNbMEl+aJT5gGnNuURTJj052
 zhPcv7s+cMSwGEt9N1/rAPnK+mKH02jKdyChrM2XTSMf9VpUuKVzwxOAOC+hXc6Rvg+9
 DmwmAhEaQbmAmDJ7Tsk79Xzl2mRqOjLL38r6zjDAHaz3gfgFEilSG8YEaglYWE8DI23J
 ynxP3BrPF23VXSsP3FQNXC6FpvNa9JF3PjczVsgC4+5pRjJg7l3kBpzZ1BDK8xhfg3X5
 JH4g==
X-Gm-Message-State: AOAM533LxoSW4ls6VZG5Y+3vCHZalrL6EvHo0MJeCui05Vpyx0fjzKUB
 TNEbiRnxzoEoKhIz0c1ninhJhGZZb5LFUKmkTn+q6qUEsUrN76kKC53a730lTQ8njTXwjlj+Mha
 WX1dzeARxTDKAsLj4eA==
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr4900603wri.13.1632897517474; 
 Tue, 28 Sep 2021 23:38:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9ZFVNJsgsMgp1Dzdn83MyjM54BhT+tLfsveJgN25bNgDo12ZnMj+8vPzruvwX5J/TSRWN+g==
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr4900591wri.13.1632897517301; 
 Tue, 28 Sep 2021 23:38:37 -0700 (PDT)
Received: from thuth.remote.csb (p549bb2bd.dip0.t-ipconnect.de.
 [84.155.178.189])
 by smtp.gmail.com with ESMTPSA id u2sm1189888wrr.35.2021.09.28.23.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 23:38:36 -0700 (PDT)
To: ~farzon <farzon@farzon.org>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: jsnow@redhat.com, Qemu-block <qemu-block@nongnu.org>
References: <163289496240.21137.12482905136173817428-0@git.sr.ht>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH qemu] issue 371: convert tabs to spaces for the block
 subsystem.
Message-ID: <29f9e4dd-fdfe-4ca1-0058-34cd5b433617@redhat.com>
Date: Wed, 29 Sep 2021 08:38:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <163289496240.21137.12482905136173817428-0@git.sr.ht>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 29 Sep 2021 06:38:52 -0000

On 29/09/2021 07.30, ~farzon wrote:
> From: Farzon Lotfi <farzonl@icloud.com>

  Hi!

Thanks for your contribution! However, there are some more rules that need 
to be followed to get a patch accepted in the QEMU project:

Please provide a proper patch description for your changes (something like: 
"QEMU coding style mandates spaces for indentation, so the TABs should get 
replaced in these files" or something similar should do it here).

Then it would be nice to have a "Resolves:" line in here, too:

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/371

That way, the issue gets closed automatically once the patch has been 
accepted. Then please also drop the "issue 371:" from the subject line.

See also:
https://wiki.qemu.org/Contribute/SubmitAPatch#Write_a_meaningful_commit_message

And finally, the most important one: You need to supply a "Signed-off-by:" 
line at the end of the patch description to make it clear that your patch 
follows the Developer Certificat of Origin. See also:

https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line

>   15 files changed, 639 insertions(+), 639 deletions(-)

I think the patch is rather big already. Could you please split it up in 
three patches instead:

- One for block/ and include/block
- One for hw/block/ and include/hw/block
- One for hw/ide/ and include/hw/ide

Please also make sure to CC: qemu-block@nongnu.org on these patches (I 
recommend to use the scripts/get_maintainer.pl script to get the right list 
of people to put into the CC: list of the patches).

  HTH,
   Thomas


