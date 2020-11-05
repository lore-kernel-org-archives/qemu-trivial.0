Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kai9p-0007AR-5Y
	for mharc-qemu-trivial@gnu.org; Thu, 05 Nov 2020 11:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kai9g-00076j-9W
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2020 11:30:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kai9e-0005Pw-2V
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2020 11:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604593827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YFnVVEtETQZI4lcdwV65DHKv7tHnVxRx8o72VcBYh/8=;
 b=E7TQjuPSkLnRXQF81IqMNh4qEGKnjWiIEnikhD8B/KtVtr6j0ExUH30yN3v+k1V7PdUKSW
 UbEyGhaAcXOqX4c4FvdNOZkqz9nl/jQJQcxLlR0X4+gWdMR/yp5I0EcdDvAb8zspZmLjRa
 g3yKExX0C6tXXOBed0XczGgZoct7haw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-tSjsD2lkP9akeyeI5Vca0g-1; Thu, 05 Nov 2020 11:30:24 -0500
X-MC-Unique: tSjsD2lkP9akeyeI5Vca0g-1
Received: by mail-wm1-f70.google.com with SMTP id t201so828071wmt.1
 for <qemu-trivial@nongnu.org>; Thu, 05 Nov 2020 08:30:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YFnVVEtETQZI4lcdwV65DHKv7tHnVxRx8o72VcBYh/8=;
 b=XprP8lx92bIG5fbne3H4btCs2r3oQAjaPCEvoKZejp5wRyNh0cLxvLQloPbJUiMEU+
 jHU60PwQrxdAVdo6/F+BVFPaypws7YY+sBiuQPbQGtD5pG4Fkdl393mytX5OhjLuwwuX
 fjAuht3C1mX3gmxov4J/Bhp1+4veX2W81QyY6CRmsmX3VsqI+Ujp9F4S+IK/Vm0QGJ9e
 IR+dO0+rBpQtSwSsU5bi3YP9OF9HQksLU+QxIdT3FRkjYbxD3S0xlUI+lE6h8Mfn/K4h
 7AoVYKm4LrE051Ff7nHnWC9/vMic7OSAcSrS2YM/mBAsc3v6ZzYNn6lGoxsQ3siViRxv
 o8MA==
X-Gm-Message-State: AOAM532nmpix2lu9laZYQ/ZmUWmVLpeInvH3MXEuY/mQMrNHb+lWxFVC
 WsxlS9xmNXcC8nPdoMPP2gEZOJw0l2DOo8/sh32UvZc71MfSPFXhJMWQu1QtZvWHC1wbWJvGtEq
 EsV3nirAtbCH30ZCB7g==
X-Received: by 2002:a5d:51d0:: with SMTP id n16mr3836558wrv.43.1604593823515; 
 Thu, 05 Nov 2020 08:30:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz49CfOm64R3Eq/LLn6Arrq1aHda18bAYop++xu7MBusEJMFhczMvhcJ4eO3CmefCDdU0rGuw==
X-Received: by 2002:a5d:51d0:: with SMTP id n16mr3836538wrv.43.1604593823356; 
 Thu, 05 Nov 2020 08:30:23 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id r3sm3206100wrm.51.2020.11.05.08.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 08:30:22 -0800 (PST)
Subject: Re: [PATCH for-5.2? 2/2] Makefile: No echoing for 'make help V=1'
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
References: <160459121308.462591.11794514422987547665.stgit@bahia.lan>
 <160459122012.462591.8467906402712875729.stgit@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <93271510-f1c3-1d67-d47d-427441ead645@redhat.com>
Date: Thu, 5 Nov 2020 17:30:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <160459122012.462591.8467906402712875729.stgit@bahia.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 22:46:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Thu, 05 Nov 2020 16:30:33 -0000

On 11/5/20 4:47 PM, Greg Kurz wrote:
> It doesn't bring much to have echoing with "make help". Suppress it
> unconditionally.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

'make help' is not as helpful as it used to be. Still:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



