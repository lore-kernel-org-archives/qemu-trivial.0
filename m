Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jaf4I-00072M-Vw
	for mharc-qemu-trivial@gnu.org; Mon, 18 May 2020 08:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jaf4G-0006wA-A7
 for qemu-trivial@nongnu.org; Mon, 18 May 2020 08:40:28 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51913
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jaf4F-0003xZ-F7
 for qemu-trivial@nongnu.org; Mon, 18 May 2020 08:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589805626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJ4IgRgsiTBA/N9X0FKjjCpdw+wTyU5KVvVwmM9WQmc=;
 b=MEEea9O64N+Wa3uLUL4xlw3B1iN6f7qWES6uXGWjQGGqTUXEtaSbJeyfsIIz6OnJD9uR7k
 DiQ4uWPHtqY285Ryh+6rXzUlQn7s9d+Z61y5oGZcc0jHpExwksMMqc+kSNEQyydXLfhxLJ
 WMv67vFQ1Cnxm9ZsfO0nMVnnBVx+UUM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-n_HntfygOFeK6XObISvwsw-1; Mon, 18 May 2020 08:40:22 -0400
X-MC-Unique: n_HntfygOFeK6XObISvwsw-1
Received: by mail-wr1-f71.google.com with SMTP id h12so5583967wrr.19
 for <qemu-trivial@nongnu.org>; Mon, 18 May 2020 05:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yJ4IgRgsiTBA/N9X0FKjjCpdw+wTyU5KVvVwmM9WQmc=;
 b=DW33gZzQ2lmMPLHdJbpeZv3WaGL9qmc/sxyQKPupgdtlNYjCE5Hwb7lWjxfKxOwpaq
 Q7RrykyyrYoRgBNg9N6WfnC9pew/17B8LXsFkm8pgbh9i6UiJb7KnmTNpTF+ewTDHDMY
 B6+EwFZhYTwdnCg9BvRwMHC2Vcs88FYiETpeRl0CMidcT6oyv6PLelb4EuB7mhps0bdG
 Y/+bb0rEv/i2fmSi8HURyjqENKxKQdoh9Bi8MupU0s/V6zid7TDkJzPZlcv/Q62NMI1+
 EuBUNkNY5apTkX2WRngGdINHPkhWvUoG/awPGsh/t3md9TcC/XLMHipX/Qxtb2LkoP2R
 +pHg==
X-Gm-Message-State: AOAM5310WvIwToO8mx7GX065lCU3+WObiN+2FOoIFFJ5F5R+t7WqsgUZ
 emi4shErFpzefzOHfHHDMkfkb7xXX07BbLIph4+qkHHpRvK9FxJOAwIdnK2HnX85vc2VZyD79/C
 x3Q/gc8PAFYWDM4ZeOA==
X-Received: by 2002:adf:f8c1:: with SMTP id f1mr19378278wrq.171.1589805621663; 
 Mon, 18 May 2020 05:40:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCAR79q1r/u+ElQ0DSvEZICk9eI3J0VHulHSHUS5E92yAv0i/D3GvHsxNo7k5eyzb/9Bk8AA==
X-Received: by 2002:adf:f8c1:: with SMTP id f1mr19378219wrq.171.1589805621356; 
 Mon, 18 May 2020 05:40:21 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.90.67])
 by smtp.gmail.com with ESMTPSA id q74sm17336275wme.14.2020.05.18.05.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 05:40:20 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] various: Remove unnecessary casts
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20200512070020.22782-1-f4bug@amsat.org>
 <871rnlsps6.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8791b385-8493-f81d-5ee3-cca5b8559c27@redhat.com>
Date: Mon, 18 May 2020 14:40:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <871rnlsps6.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:52:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 18 May 2020 12:40:29 -0000

On 15/05/20 07:58, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> Remove unnecessary casts using coccinelle scripts.
>>
>> The CPU()/OBJECT() patches don't introduce logical change,
>> The DEVICE() one removes various OBJECT_CHECK() calls.
> Queued, thanks!
> 
> Managing expecations: I'm not a QOM maintainer, I don't want to become
> one, and I don't normally queue QOM patches :)
> 

I want to be again a QOM maintainer, but it's not the best time for me
to be one.  So thanks for picking up my slack.

Paolo


