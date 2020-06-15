Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jkjJb-0000UI-FH
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jun 2020 03:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jkjJY-0000T7-Gz
 for qemu-trivial@nongnu.org; Mon, 15 Jun 2020 03:13:52 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46067
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jkjJV-0002Ze-E7
 for qemu-trivial@nongnu.org; Mon, 15 Jun 2020 03:13:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592205227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bcE1sJcTgxf9JcZw+/HYUXG5c649gABbFGq3WamqEQY=;
 b=TIiUxBIBHsDukNBkgnUqJObDbQzStiE96bHEvMr9byIu2rRVR76ijbqV+FQTffC3LR+87z
 2gkupBKqgqdtu+5BXUrS6SbMMy372D/HzABZj5oTfaBRED0DhPQX3G7VTW7w33PLl4CFgK
 JznnYu8AwC2mVJq4+JfZChEvkig/utY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-ivCSRk4FPGWC1ep9Fv-NQg-1; Mon, 15 Jun 2020 03:13:45 -0400
X-MC-Unique: ivCSRk4FPGWC1ep9Fv-NQg-1
Received: by mail-wr1-f69.google.com with SMTP id i6so6647310wrr.23
 for <qemu-trivial@nongnu.org>; Mon, 15 Jun 2020 00:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bcE1sJcTgxf9JcZw+/HYUXG5c649gABbFGq3WamqEQY=;
 b=A2hf8SyupBQTocvnPAB77ij6TeBwykZOcfA1CK0cRH9aN67B4xwkL3wKyukveAQKkM
 XbnLTKPx6kAJ6vunCvBERIcrWhApgUjpo3atwe7NMQxnk/1OEmNdhII7aG5NoT+8mcwy
 rd3zWpME/4VQRY8ESH2rEbxJNMEftv9rzFiVVsg36/JTV37VzWBJsrf7M02hnX7Li+1e
 2XNXrjP0K2gUSe0bhhedWIC1wmO6EFqgls5kzyR7jBMgG6GXAXpZNPFINXetcXtvc0IZ
 47GUoFiJYrMCZHjqvZFTfOMPeI470GoSqiDVkyRwK6x2/SN7K0kz6cFRCMfLFXFVQCfU
 GTZg==
X-Gm-Message-State: AOAM5305LfFKh+hwx8rkJDaAMLKD1yLqOvzMwZPJAT5+pcNpmp5qwd3x
 JrmJiKEuhTBjZLUh6uME4KLCePPkGJb5bZSjm2qSr6N4AJ+h6tla6GTiduKioEY745oG6ltiSMP
 u+dMTStshNgvLoeGi8g==
X-Received: by 2002:a1c:a5d4:: with SMTP id o203mr11530449wme.98.1592205224589; 
 Mon, 15 Jun 2020 00:13:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1BgpIeEbSqzCTvIAhQqiQo2Zpw/YuqSsjDVndF85x31itNXadmtv6fqOnF0LAAwXVK8S2kw==
X-Received: by 2002:a1c:a5d4:: with SMTP id o203mr11530423wme.98.1592205224250; 
 Mon, 15 Jun 2020 00:13:44 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c461:afc9:1:2046?
 ([2001:b07:6468:f312:c461:afc9:1:2046])
 by smtp.gmail.com with ESMTPSA id k21sm24148236wrd.24.2020.06.15.00.13.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 00:13:43 -0700 (PDT)
Subject: Re: [PATCH v2] Makefile: Remove generated files when doing
 'distclean' (and 'clean')
To: Thomas Huth <thuth@redhat.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20191008082815.8267-1-thuth@redhat.com>
 <CAL1e-=gYkhM99Ee0LxZJ5dCjeEdC08G4_Tm3WCZpCSWvJ=b26Q@mail.gmail.com>
 <4bfea125-eb63-f4a2-bca0-bce462f73d89@redhat.com>
 <CAFEAcA_+V7SNsxPSgsd04s8f7PnP3qdyXMp6NvS2inHjE08pJw@mail.gmail.com>
 <CAL1e-=ijjbTG19NHnsDrcJdb7kajBdcndMT8JXymqC6UViiitQ@mail.gmail.com>
 <770c89b9-44d1-0982-34ff-1830911ac413@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <89c5b73f-2294-b58a-85e0-5ed64926fb0c@redhat.com>
Date: Mon, 15 Jun 2020 09:13:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <770c89b9-44d1-0982-34ff-1830911ac413@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 01:43:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 15 Jun 2020 07:13:52 -0000

On 15/06/20 07:17, Thomas Huth wrote:
> That depends ... Marc-André, Paolo, what's the status of the meson patch
> series? Do you think it will be merged for the next release already? If
> so, it does not make much sense to respin my distclean patch. Otherwise
> I could do another iteration...

I prefer to aim for 5.2, making it the very first series merged there
and forcing everyone else to rebase.

Paolo


