Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSh90-0001ZW-Ec
	for mharc-qemu-trivial@gnu.org; Wed, 14 Oct 2020 09:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSh8y-0001Wo-KC
 for qemu-trivial@nongnu.org; Wed, 14 Oct 2020 09:48:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSh8w-0008DL-6w
 for qemu-trivial@nongnu.org; Wed, 14 Oct 2020 09:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602683316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ttasglJhGde7vJ5qYn/fjxo5arUXRuHvccFkj+Gi+T4=;
 b=LqzF59M8Gw5UPGfUQ02ecDNvEmkOblRXHONq74JQCqtmVtMU/D4X2B0+GWT2jY9OTikJih
 3jWEijkjoQ4WkgMVgzNIM/1oFT7EIVElrV+GQyNMokck+hMkDKhcU2kkiGr2Ol+j72yCJI
 WnZSz8BF3eQaScwbubY65hvIwyvi++o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-8MGV8GdrOPqrW2JdEWiqFA-1; Wed, 14 Oct 2020 09:48:35 -0400
X-MC-Unique: 8MGV8GdrOPqrW2JdEWiqFA-1
Received: by mail-wm1-f69.google.com with SMTP id z7so653317wmi.3
 for <qemu-trivial@nongnu.org>; Wed, 14 Oct 2020 06:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ttasglJhGde7vJ5qYn/fjxo5arUXRuHvccFkj+Gi+T4=;
 b=IiBEzbkBEzo4XRZi7VPQOedW8h1RNKdXB0uEnC3s3b2zanRa7Y/zAigOfaf9jzIHj2
 6ViZ29jNwCuZ5iSbk1lZgz5x6mQr3gCB4Iob20FKU2E9izGJjl6QiZgfmGV934AHmXC5
 5anOyK2SegfeDksAohOFlnqxV4Gi5t7k2vh2NwlVZHBeLjFvI881cS3RLztJRYxA2rEL
 l4q0e4w+rifHqEKdemudwGOR9ptc1AxQG73n0VLK4pkPqs/N7reAidaDychAzchm0lwd
 NcyAnH1Yz/N7qkDFyxCxDXKh+i7RM9fX/qDZXwkIP1l4xJx8/7MmoXyYEwuf7YfA8VDy
 anCw==
X-Gm-Message-State: AOAM533i3NTtuTPiJVsD/D7Lj3G4srYBohXOWzTQxaUWDcn6ZfJjkfaj
 LG9VlbVYd2IAusV499FZ04g1oOa2pDQ6DyPGfbYysndv9pscmS9aH3n0eUOLal/PkoTRMYgiaOY
 YsvCm4IWGy6ziVtjRmQ==
X-Received: by 2002:a1c:a949:: with SMTP id s70mr3751512wme.17.1602683314251; 
 Wed, 14 Oct 2020 06:48:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdQl315plmIF47FeIW43bT/ALpQqObtl60RbG/3Y/WMwRNUJfQVozhJXKr7TrePOZbru5neg==
X-Received: by 2002:a1c:a949:: with SMTP id s70mr3751479wme.17.1602683313937; 
 Wed, 14 Oct 2020 06:48:33 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id p4sm5160001wru.39.2020.10.14.06.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2020 06:48:33 -0700 (PDT)
Subject: Re: [PATCH] cpus: Drop declaration of cpu_remove()
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <160268285707.1107461.15035929822602623985.stgit@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <431287f0-94a9-8c81-443a-b3d80ca33a32@redhat.com>
Date: Wed, 14 Oct 2020 15:48:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <160268285707.1107461.15035929822602623985.stgit@bahia.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 01:12:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 14 Oct 2020 13:48:40 -0000

On 10/14/20 3:40 PM, Greg Kurz wrote:
> cpu_remove() got superseded by cpu_remove_sync() in commit dbadee4ff4a0,
> but its prototype wasn't removed. We could possibly keep the shorter
> cpu_remove() naming but it seems better to highligth that this blocks
> until the CPU thread is joined.
> 
> Fixes: dbadee4ff4a0 ("cpus: join thread when removing a vCPU")
> Cc: pbonzini@redhat.com
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>   include/hw/core/cpu.h |    8 --------
>   1 file changed, 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


