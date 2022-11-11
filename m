Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otVNR-0004PT-Oc
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2022 09:51:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otVNP-0004Oy-Bm
 for qemu-trivial@nongnu.org; Fri, 11 Nov 2022 09:51:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otVNN-0006bX-LK
 for qemu-trivial@nongnu.org; Fri, 11 Nov 2022 09:51:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668178284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfStXV0NotszyEtPaVv1LroQqpNSYVTEF+YW+bvUKlM=;
 b=YkYAcZLPES6G1ekeme+vJWRa90LS+2pmc4QvihyoL3/wpX+9Ri/jbHC6lLZPtdDdyLJYG+
 g5HkhpB2MbDkwuQNNSaZXvNPLTDIG5uz3lj06nQKWc+yrxhV32QcsYcxmEfvYDsl+K3f4u
 zGD7oWjR/Wm9NkzLVoeKluhL3OVPdxU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-o0HmqoiHMHK93hnlH0Za7A-1; Fri, 11 Nov 2022 09:51:23 -0500
X-MC-Unique: o0HmqoiHMHK93hnlH0Za7A-1
Received: by mail-wm1-f70.google.com with SMTP id
 l42-20020a05600c1d2a00b003cf8e70c1ecso4513270wms.4
 for <qemu-trivial@nongnu.org>; Fri, 11 Nov 2022 06:51:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HfStXV0NotszyEtPaVv1LroQqpNSYVTEF+YW+bvUKlM=;
 b=TfCWOK6/sMU5gH8bLuf1a1G3FjoyzKhN1KwkNjclQ8mysQHCVN+/e7JdD1zuNh/cOz
 X0UTHqlOg2RSVssmom4IWC7uPZBBfRVjmIbVLB9SGBw1sgPsh8h1aGFiZUwEAjYEKNsc
 PlE2t66GRCr2tkTt24tvd0s2swFLTwt+PBldTClGnVjLDsHHFdXz9GT7STN2JE4OENUJ
 KrP+6bTWRuI1lGH36kQ57RBs/soWlrbgqHDvCmahQySbRXXR6/RueCfyAR0xRb/A5H8R
 PNBzNuWl+G21jO792XJUO9W2RfcKvy+WRTKw3sfqS51vVDPfwQbB4LUQ2q+8GtsWZJjW
 IzhQ==
X-Gm-Message-State: ANoB5plcabD9CvXfCTPYyAfJYy134UkitORYLJCCBVUY+Ia3mSESFH8T
 aH25HH5akKUL0bqD5n/Rk3evxrsAH4aUOC5GMP0BQpTrCjvBwRvWJSjKmsomQdrDhwEwIxYL/vC
 XqP7ArifNk00IZlrkJg==
X-Received: by 2002:a5d:68c7:0:b0:236:6fb9:9cf5 with SMTP id
 p7-20020a5d68c7000000b002366fb99cf5mr1385968wrw.709.1668178281878; 
 Fri, 11 Nov 2022 06:51:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7uyP7wzq7YGWhwQpuwwFwMMnYv5aQzAEGin+GN6+rOTDd9aODtwYAFWWsVemhNvlob/xUjiA==
X-Received: by 2002:a5d:68c7:0:b0:236:6fb9:9cf5 with SMTP id
 p7-20020a5d68c7000000b002366fb99cf5mr1385964wrw.709.1668178281655; 
 Fri, 11 Nov 2022 06:51:21 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 e24-20020a5d5958000000b002356c051b9csm2033422wri.66.2022.11.11.06.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 06:51:21 -0800 (PST)
Date: Fri, 11 Nov 2022 09:51:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH v2] acpi/tests/avocado/bits: some misc fixes
Message-ID: <20221111095106-mutt-send-email-mst@kernel.org>
References: <20221111123108.1231451-1-ani@anisinha.ca>
 <20221111093255-mutt-send-email-mst@kernel.org>
 <CAARzgwxDEwMNqxH9Q9Otf3Tn6ZUUJ2onJKNQJ3iUzmAimGAA7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAARzgwxDEwMNqxH9Q9Otf3Tn6ZUUJ2onJKNQJ3iUzmAimGAA7A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Nov 2022 14:51:28 -0000

On Fri, Nov 11, 2022 at 08:16:22PM +0530, Ani Sinha wrote:
> 
> 
> On Fri, Nov 11, 2022 at 20:05 Michael S. Tsirkin <mst@redhat.com> wrote:
> 
>     On Fri, Nov 11, 2022 at 06:01:08PM +0530, Ani Sinha wrote:
>     > Most of the changes are trivial. The bits test timeout has now been
>     increased
>     > to 110 seconds in order to accommodate slower systems and fewer
>     unnecessary
>     > failures. Removed of the reference to non-existent README file in docs.
>     >
>     > CC: Thomas Huth <thuth@redhat.com>
>     > CC: qemu-trivial@nongnu.org
>     > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> 
>     You need to pick a tree through which work on these
>     will be merged.
>     If it's my pc/pci tree you need to add that to MAINTAINERS
>     so I get to see the patches.
> 
> 
> Adding you to MAINTAINERS should be enough right? 
> 

That's fine, yes.

> 
> 
> 
>     > ---
>     >  changed from v1: address Thomas' suggestions.
>     >
>     >  docs/devel/acpi-bits.rst   | 7 +++----
>     >  tests/avocado/acpi-bits.py | 5 +++--
>     >  2 files changed, 6 insertions(+), 6 deletions(-)
>     >
>     > diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
>     > index c9564d871a..2c776ab166 100644
>     > --- a/docs/devel/acpi-bits.rst
>     > +++ b/docs/devel/acpi-bits.rst
>     > @@ -38,10 +38,9 @@ Under ``tests/avocado/`` as the root we have:
>     >     │ ├── bits-config
>     >     │ │ └── bits-cfg.txt
>     >     │ ├── bits-tests
>     > -   │ │ ├── smbios.py2
>     > -   │ │ ├── testacpi.py2
>     > -   │ │ └── testcpuid.py2
>     > -   │ └── README
>     > +   │   ├── smbios.py2
>     > +   │   ├── testacpi.py2
>     > +   │   └── testcpuid.py2
>     >     ├── acpi-bits.py
>     > 
>     >  * ``tests/avocado``:
>     > diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
>     > index 8745a58a76..2edc36fc26 100644
>     > --- a/tests/avocado/acpi-bits.py
>     > +++ b/tests/avocado/acpi-bits.py
>     > @@ -385,8 +385,9 @@ def test_acpi_smbios_bits(self):
>     >          self._vm.launch()
>     >          # biosbits has been configured to run all the specified test
>     suites
>     >          # in batch mode and then automatically initiate a vm shutdown.
>     > -        # sleep for maximum of one minute
>     > -        max_sleep_time = time.monotonic() + 60
>     > +        # sleep for maximum of a minute and 50 seconds in order to
>     accommodate
>     > +        # even slower test setups.
>     > +        max_sleep_time = time.monotonic() + 110
>     >          while self._vm.is_running() and time.monotonic() <
>     max_sleep_time:
>     >              time.sleep(1)
>     > 
>     > --
>     > 2.34.1
>     >
>     >
>     >
> 
> 


