Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGIcH-000402-Nr
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2020 05:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGIcB-0003w4-LT
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 05:11:36 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60278
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGIc7-0003h2-Ns
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 05:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599729090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2S+dASRYX7B6gIlF4p7C2wh2Lfe0xE+w23SHE4uKPDk=;
 b=Mogiga29Ferz+3+p/3BT3iBIIBjugg4GvnL+7tJb2CR8UPALkjWZy84W4bhm3Ff0pz59xY
 KnYqXN7Qo+Hwwg8U1EvUylBxwDG1O5jScN/T+v0h8WjWBFe2jui8NzJH3e18bsUHcSqAvJ
 8cu8akOjfcJGNnOhgnApqhf0XDPyVYc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-ijPDmP3UNhq2bTRLf5h9OQ-1; Thu, 10 Sep 2020 05:11:26 -0400
X-MC-Unique: ijPDmP3UNhq2bTRLf5h9OQ-1
Received: by mail-ed1-f70.google.com with SMTP id y21so2144663edu.23
 for <qemu-trivial@nongnu.org>; Thu, 10 Sep 2020 02:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2S+dASRYX7B6gIlF4p7C2wh2Lfe0xE+w23SHE4uKPDk=;
 b=pywTAHQ46IfoM29iugxwBfH5s8SQMxUxLo9NV8w/SR8pZ2HDeRdw4ggyssL7xJRCnK
 A42hKMByI4vU365Zv2VZVS/me8Nzh1AneUseB7mOkXeUAQpAVqCM2XzJPrKNyikZRDId
 ATyg8rQuJxzcPggqP3ncl55isGotkySc/u90qIb2nSj3X56kSWgEeZIdNuUrGXwcmwZI
 kjhglK4nKdx5fQ2EZhpMdxYzDmKUszuuTncr4NuaQlQKTVyPfP4Ot0I6I40X38g//NyJ
 vXgdQny9WGdaKdZNDw+IzVhkrsfdt7v53ttoVhbg1LSA6V4h+NaCTZWvFE0spZeOygGM
 VlcA==
X-Gm-Message-State: AOAM532HWyPRTXDtnYu+LmZIe484/ISzY7vgYc0wJMIh3uXjEbayO8Do
 pypJIl2yMvkaLOjO0eHbxGzqHl094SM0drpV3B6SJe+jAK9zCocLCcesIXgynvWyBlM6+eWWVY/
 4/R8kIOpFIbT0/hJsUg==
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr8069349ejd.533.1599729085468; 
 Thu, 10 Sep 2020 02:11:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDlmTUr6fJdtjDWNBypBMs7J2QrRY7INrpq4ulD5kRBc5YH6RHCcQDfHDuKW2yVlaRaNE9kA==
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr8069317ejd.533.1599729085289; 
 Thu, 10 Sep 2020 02:11:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:2744:1c91:fa55:fa01?
 ([2001:b07:6468:f312:2744:1c91:fa55:fa01])
 by smtp.gmail.com with ESMTPSA id br7sm6403283ejb.76.2020.09.10.02.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 02:11:24 -0700 (PDT)
Subject: Re: [PATCH 5/6] hw/pci-host/q35: Rename PCI 'black hole as '(memory)
 hole'
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Joel Stanley <joel@jms.id.au>
References: <20200910070131.435543-1-philmd@redhat.com>
 <20200910070131.435543-6-philmd@redhat.com>
 <7dbdef90-1ca6-bf27-7084-af0c716d01d9@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d04610d8-2ba3-4f36-2820-56044324a73d@redhat.com>
Date: Thu, 10 Sep 2020 11:11:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7dbdef90-1ca6-bf27-7084-af0c716d01d9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 00:49:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.576, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 10 Sep 2020 09:11:36 -0000

On 10/09/20 09:15, Thomas Huth wrote:
> On 10/09/2020 09.01, Philippe Mathieu-Daudé wrote:
>> In order to use inclusive terminology, rename "blackhole"
>> as "(memory)hole".
> A black hole is a well-known astronomical term, which is simply named
> that way since it absorbes all light. I doubt that anybody could get
> upset by this term?
> 

Agreed.  This is a memory region that absorbs all writes and always
reads as zero, the astronomical reference is obvious.

Paolo


