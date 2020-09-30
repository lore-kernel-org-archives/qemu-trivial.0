Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNbzp-0002mo-3b
	for mharc-qemu-trivial@gnu.org; Wed, 30 Sep 2020 09:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kNbzn-0002kK-A5
 for qemu-trivial@nongnu.org; Wed, 30 Sep 2020 09:18:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kNbzi-0003Vv-6M
 for qemu-trivial@nongnu.org; Wed, 30 Sep 2020 09:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601471885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RibcTPJb5Zq7PCVPFosBD7AQt0RarvGmMZy6yMQy6Qc=;
 b=NvSYcBqQd7MV+XF5CiGOh/zf9hU0LVN1uMYst0Y0YVyq6VubV6Zu5R2X8l7JiYaDKTO36O
 z9It2qBiD8ksGvsCiPxH5UKU5vdPpcpt87sSWWPEDmLPG4dvVrsZSDagpus+7z7m+QtGu/
 k8XubdbqmM5x2Me2uykfQ8KUEb2PX0k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-YpXCaukuMZiXR_6Z-XlOnw-1; Wed, 30 Sep 2020 09:18:02 -0400
X-MC-Unique: YpXCaukuMZiXR_6Z-XlOnw-1
Received: by mail-wr1-f69.google.com with SMTP id o6so607695wrp.1
 for <qemu-trivial@nongnu.org>; Wed, 30 Sep 2020 06:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RibcTPJb5Zq7PCVPFosBD7AQt0RarvGmMZy6yMQy6Qc=;
 b=RLie2lSCGu0I+ULoPLA/JKRu3U4UiUHVS5c41XECsoQ+6J0vA4EDx5gRAgM7oIIA5L
 3jnWsLd05XJ1tCJm7WJ4Tz7U2/LiiqQQM5szLBtmOWTOyFmQTRwv05PPJgxl/SRZ+ykv
 onuZP1mvLENA36uHgIu67fEw88w8tiA90RX6wcHfZ4IVErWrbfa5leYFDR51LhPWaXpl
 AoNOhSmJg9l5YojWk1WI88E0qh5Axxe5apkv+iaKLqUi5Pn4GBItatnw3n1xnU9DTGZD
 cHdoSKsOvuNsqtJGv31rxlvp32nR3PyRCWCpgler9IUP9n/S24ZeGX65vHq3rn6yejWC
 5ngQ==
X-Gm-Message-State: AOAM533Z6DjpF28W4P2pZTR+OBnwTYe1QmljPM+bamkwUfVXGSDKwrUK
 52Knfr5cL+WFXjUuHD/yc9O/+LXexnrJLABbnvbjsYXtC7fIWu/YHul16lR41adqiDMCMDZuqfa
 dANsLJ1E0We1Iv41WRQ==
X-Received: by 2002:a7b:cc84:: with SMTP id p4mr3136199wma.58.1601471881276;
 Wed, 30 Sep 2020 06:18:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvR9v+AADxXGN/7w1gG1Uwti9rLguDEldc/2LUbSFnr0vtMA2K/KTMPgkFcY4ePRdJIqHheA==
X-Received: by 2002:a1c:32c6:: with SMTP id y189mr3177047wmy.51.1601471880395; 
 Wed, 30 Sep 2020 06:18:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:75e3:aaa7:77d6:f4e4?
 ([2001:b07:6468:f312:75e3:aaa7:77d6:f4e4])
 by smtp.gmail.com with ESMTPSA id s11sm2864634wrt.43.2020.09.30.06.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 06:17:59 -0700 (PDT)
Subject: Re: [PATCH] job: delete job_{lock, unlock} functions and replace them
 with lock guard
To: Elena Afanasova <eafanasova@gmail.com>, John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20200929134214.4103-1-eafanasova@gmail.com>
 <b055221b-c436-1ff3-b986-5a522178fde8@redhat.com>
 <db5d1fc04bdb15da6c9ecf65402a784aab856ede.camel@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <072ee259-f3e1-a354-abec-58cfe3d0d4ac@redhat.com>
Date: Wed, 30 Sep 2020 15:17:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <db5d1fc04bdb15da6c9ecf65402a784aab856ede.camel@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 30 Sep 2020 13:18:11 -0000

On 30/09/20 14:15, Elena Afanasova wrote:
>>> +    WITH_QEMU_LOCK_GUARD(&job_mutex) {
>>> +        if (ns != -1) {
>>> +            timer_mod(&job->sleep_timer, ns);
>>> +        }
>>> +        job->busy = false;
>>> +        job_event_idle(job);
>> Is this new macro safe to use in a coroutine context?
> Hi, I suppose it's safe. It would be nice to get some more opinions
> here.
> 

Yes, the macro is just a wrapper around the qemu_mutex_lock/unlock
functions (or qemu_co_mutex_lock/unlock depending on the type of its
argument).

Paolo


