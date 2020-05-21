Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jblpF-0005GR-KD
	for mharc-qemu-trivial@gnu.org; Thu, 21 May 2020 10:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jblpE-0005CR-CI
 for qemu-trivial@nongnu.org; Thu, 21 May 2020 10:05:32 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:20340
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jblpD-0003Mc-Ds
 for qemu-trivial@nongnu.org; Thu, 21 May 2020 10:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590069930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WuW4LhQZmtRPxOdsGv0UfenYyJdURtJzEmFBQoF1B8A=;
 b=MujZIltEVJ+iQRUq5IBi1Gv8QqZB5FKDeNgVTlNf0myjLtQkQ7rEVSOmjOVuy0bgXMKZTA
 M/bEuQ9uwcCcH5Kt2zLoSsoWpwBQjHyBe69ivGY4kDUwdcqWOfT29gC8hsRtO+xnuhkF91
 v5GA1ItdaQXJD1xW3Kn7j1kaYJ2xlbQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-2iuHSA-OMuyJlW6K0RaYlA-1; Thu, 21 May 2020 10:05:22 -0400
X-MC-Unique: 2iuHSA-OMuyJlW6K0RaYlA-1
Received: by mail-wr1-f70.google.com with SMTP id e14so2949708wrv.11
 for <qemu-trivial@nongnu.org>; Thu, 21 May 2020 07:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WuW4LhQZmtRPxOdsGv0UfenYyJdURtJzEmFBQoF1B8A=;
 b=G+RSXgn+MIsgBx59eq8my96kA13CM0zNnRVr3wh9n3q0W9RGpIv4Q2x/PQ6yVjoKiP
 +gPYPeL8+M7YQ2Di3I4OxZyFZcIGIcr7dGSwu2bCVDyL8P0hAsqk4xrDt4GMdOC3uer1
 9dn+ueqbIeNNsLcEC8NPLOKt3kbEKL7WDzQzOLecQIVXE3Alwte2tv+6aH4vp37FD3/h
 2+Q7U4Lzpfmz6qi0zw6hqj4SEsgxUl2JkzICQ3LLgPO2oSqq08x5D/pRMziXrJ0Y+Rmc
 pjwwyFQaV5Qa8GyuK9rR+O031mZzM8OO1Se415rjWJbw5LPuZJX3uAITaCoawlLWfypo
 EISQ==
X-Gm-Message-State: AOAM531QLaTvsO8W4rFvKvUQPD/kZmC7UxCLYi1KM7vCqnmd5AvGB6Dr
 Kel2rLzGXQvFwE9wI5PtVkLdAvuAbnwX6LadM7s/rb7qE4/Of+Zv3eGCBW+Jb8OLZu1t0k6TpKN
 AHSDPxq2kgC7KkyiOeQ==
X-Received: by 2002:a7b:c205:: with SMTP id x5mr9562695wmi.135.1590069920837; 
 Thu, 21 May 2020 07:05:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+9vDo+k5k5h2/AhbhlgqJeb0CrNG8dWFa5E8+nrQcjn7Lroo1lNJb24UV5jL3E+o+6JSXCg==
X-Received: by 2002:a7b:c205:: with SMTP id x5mr9562654wmi.135.1590069920578; 
 Thu, 21 May 2020 07:05:20 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.94.134])
 by smtp.gmail.com with ESMTPSA id c140sm6952309wmd.18.2020.05.21.07.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 07:05:19 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] various: Remove unnecessary casts
To: Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
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
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
References: <20200512070020.22782-1-f4bug@amsat.org>
 <871rnlsps6.fsf@dusky.pond.sub.org>
 <8791b385-8493-f81d-5ee3-cca5b8559c27@redhat.com>
 <87imgt9ycp.fsf@dusky.pond.sub.org>
 <2f4607cf-90a9-ca9a-4ef6-a8358631cdf0@kaod.org>
 <87k1187dbo.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ffae374d-9429-5bdc-d415-053aaa1b033c@redhat.com>
Date: Thu, 21 May 2020 16:05:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87k1187dbo.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 01:47:40
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
X-List-Received-Date: Thu, 21 May 2020 14:05:32 -0000

On 19/05/20 06:34, Markus Armbruster wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> On 5/18/20 3:17 PM, Markus Armbruster wrote:
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>
>>>> On 15/05/20 07:58, Markus Armbruster wrote:
>>>>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>>>>
>>>>>> Remove unnecessary casts using coccinelle scripts.
>>>>>>
>>>>>> The CPU()/OBJECT() patches don't introduce logical change,
>>>>>> The DEVICE() one removes various OBJECT_CHECK() calls.
>>>>> Queued, thanks!
>>>>>
>>>>> Managing expecations: I'm not a QOM maintainer, I don't want to become
>>>>> one, and I don't normally queue QOM patches :)
>>>>>
>>>>
>>>> I want to be again a QOM maintainer, but it's not the best time for me
>>>> to be one.  So thanks for picking up my slack.
>>>
>>> You're welcome :)
>>
>> Could you help me getting this patch merged ? :)
>>
>> http://patchwork.ozlabs.org/project/qemu-devel/patch/20200404153340.164861-1-clg@kaod.org/
> 
> I have more QOM patches in the pipe, and I may well post another QOM
> pull request while Paolo is busy with other stuff.  I'll consider
> including other QOM patches then.  Non-trivial ones need an R-by from
> Paolo, Daniel or Eduardo.

I queued Cedric's.

Paolo


