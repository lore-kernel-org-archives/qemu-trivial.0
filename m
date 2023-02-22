Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUvfn-0000TE-RN
	for mharc-qemu-trivial@gnu.org; Wed, 22 Feb 2023 15:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUvfa-0000Qd-SG
 for qemu-trivial@nongnu.org; Wed, 22 Feb 2023 15:24:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUvfZ-0002cU-02
 for qemu-trivial@nongnu.org; Wed, 22 Feb 2023 15:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677097492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ThRR9ZvME1UJFsVA+tDom+uoEmK2FkyktvVEkOXtTk=;
 b=LZCLrr1379Om5WdMU3EwhLDYqssi4pO9ZnRkCxRrkif7hO4ifi6vkxeZOpEOtdDx98A+zO
 9/LpyQYoi7cP/T8JT6/okCDHRKm3G1lxzpiDmPgx4BdUHSUxAzX4l91pzGL0aSfcpgJMoz
 pMqyvpffMO6/tc9xkJke/2mfr6k7Syk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-171-nGkCiXiSPQWYyDnnEoDiOg-1; Wed, 22 Feb 2023 15:24:51 -0500
X-MC-Unique: nGkCiXiSPQWYyDnnEoDiOg-1
Received: by mail-wr1-f70.google.com with SMTP id
 i11-20020a5d584b000000b002c5400f5c76so2031551wrf.14
 for <qemu-trivial@nongnu.org>; Wed, 22 Feb 2023 12:24:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ThRR9ZvME1UJFsVA+tDom+uoEmK2FkyktvVEkOXtTk=;
 b=Yoxgqr63aqg/NxMqDMT/ZQoenLPsAFcFQA24CZ5nowVvoYZyrZip7JnGM773l5sMds
 yTIaT3piM0wL75Awgkb60N0TPrcjG4fXn0+D9mzhiqvZuPAtwEdY0URocq7pkPo7/vyH
 fiesqWCRorGfng4WRspeXJ2Boo+FehVudUOdewkT7Biwmfr+a0AIoIDtzT/0uTPtj6xf
 L/HpVcORY7rZWXFVII3uFdcWZzJKOfeu4f2YUSfmok9jzgJ7pg3/54uyYgZhAsfcW24a
 90m94OtApHY8yrxsyulRMwyq0zIfJt3YFADsLIJ2zMaFATJm6ZqnVhAZvjOMi3KHQoMV
 PbnQ==
X-Gm-Message-State: AO0yUKUmOj20G4ofU1Pkf/3mjJXYxSLLFxmeQH8VI7aC1F6B8H2B6ryu
 KyTTW2RJEWrgzaRrGYXErQzgZmConD6Caa4RNMJAVvZJGfrrnpZnANlVhv3mhv+Spf3gppybGmV
 W3/SJNV5gXAEaA+yStA==
X-Received: by 2002:a05:600c:16c5:b0:3dc:37d0:e9df with SMTP id
 l5-20020a05600c16c500b003dc37d0e9dfmr1885110wmn.14.1677097489951; 
 Wed, 22 Feb 2023 12:24:49 -0800 (PST)
X-Google-Smtp-Source: AK7set87/ouQZkQgYQmjpUh0hD8ezXB9tR/mdUReJu+xA7XG0mIcJ6pXah+0w57h6Tjj4QuA7nBrhw==
X-Received: by 2002:a05:600c:16c5:b0:3dc:37d0:e9df with SMTP id
 l5-20020a05600c16c500b003dc37d0e9dfmr1885094wmn.14.1677097489556; 
 Wed, 22 Feb 2023 12:24:49 -0800 (PST)
Received: from redhat.com ([2.52.2.78]) by smtp.gmail.com with ESMTPSA id
 w18-20020a05600c475200b003e220998b6bsm10486554wmo.17.2023.02.22.12.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 12:24:48 -0800 (PST)
Date: Wed, 22 Feb 2023 15:24:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v4 3/9] hw/i386/pc_q35: Reuse machine parameter
Message-ID: <20230222152331-mutt-send-email-mst@kernel.org>
References: <20230213162004.2797-1-shentey@gmail.com>
 <20230213162004.2797-4-shentey@gmail.com>
 <9f80bb33-40e7-fc57-1515-c3764f57da46@linaro.org>
 <CAG4p6K6JSkv3VqwUc3CYhfq0EbR7feKLBquduP_p4143DnaGig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAG4p6K6JSkv3VqwUc3CYhfq0EbR7feKLBquduP_p4143DnaGig@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
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
X-List-Received-Date: Wed, 22 Feb 2023 20:24:59 -0000

On Wed, Feb 22, 2023 at 06:52:02PM +0100, Bernhard Beschow wrote:
> Am 22. Februar 2023 11:03:38 UTC schrieb "Philippe Mathieu-Daudé"
> <philmd@linaro.org>:
> >On 13/2/23 17:19, Bernhard Beschow wrote:
> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> Reviewed-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>   hw/i386/pc_q35.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> >> index 66cd718b70..dee2b38474 100644
> >> --- a/hw/i386/pc_q35.c
> >> +++ b/hw/i386/pc_q35.c
> >> @@ -218,7 +218,7 @@ static void pc_q35_init(MachineState *machine)
> >>       pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
> >>                      pci_hole64_size);
> >>   -    object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
> >> +    object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host));
> >>       object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
> >>                                OBJECT(ram_memory), NULL);
> >>       object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
> >
> >Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> >
> >Long term we should duplicate/extract Q35MachineState from
> >PCMachineState and add a Q35PCIHost field, then use object_initialize_child; removing this object_property_add_child()
> >call.
> 
> The Q35 and PC machines duplicate a lot of code indeed. So I was
> thinking more along the lines of consolidating with pc_piix ;)

The reason is that we are trying to limit changes to pc_piix and
focus development on Q35.

> The
> idea would be to get a peek preview into a configuration-driven future
> where the PCI host bridges (Q35 or I440FX) are dynamically
> instantiated based on configuration data. They would also be
> configured through their QOM interfaces only.
> 
> I've submitted a series where the Q35 host bridge gets a QOM cleanup
> [1] and I've got a series locally resolving i440fx_init(). Both series
> combined bring these two device models close together regarding their
> QOM interface. I've not submitted the i440fx series yet since it is
> blocked by this series.
> 
> One further step for pc_q35 and pc_piix consolidation would be to
> factor ICH9 PCI devices (not functions!) into self-contained models,
> like is underway with PIIX(3). I've started with ICH9 cleanup already
> [2] and I'm waiting for the PIIX consolidation to land in order to be
> able to make more progress here.
> 
> Note that pc_q35 and pc_piix consolidation is just an idea for now
> which could also turn out to be a bad one. If the two machines just
> ended up sharing more code that could IMO be considered a success as
> well.
> 
> Best regards,
> Bernhard
> 
> [1] https://patchew.org/QEMU/20230214131441.101760-1-shentey@gmail.com/
> [2] https://patchew.org/QEMU/20230213173033.98762-1-shentey@gmail.com/


