Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1opBCx-0001jd-RV
	for mharc-qemu-trivial@gnu.org; Sun, 30 Oct 2022 12:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opBCw-0001j8-03
 for qemu-trivial@nongnu.org; Sun, 30 Oct 2022 12:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opBCt-00032c-Sr
 for qemu-trivial@nongnu.org; Sun, 30 Oct 2022 12:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667147442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XiSgRn3OF3vBbLkXmrF8qjKf9TlcfaSBGLDjFGgcnaE=;
 b=U1rI0DH+jsGukRuYPEv0m/Mk8IbwEtepiomXImEkXoe7iF0NGgkTl4mYv9IezSL+Oa23/3
 9KjwHKEZ36bGdW4w8Fd727ucAye2z9OFe/9Wbz6rKD4USAazGlKMlSgNzJX/qw2A/Z56o3
 6eydS85nEcxhFSCErw4dMFWr+B2+2Ww=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-228-7_x6pyKmMJaf3-577rdpRg-1; Sun, 30 Oct 2022 12:30:39 -0400
X-MC-Unique: 7_x6pyKmMJaf3-577rdpRg-1
Received: by mail-wr1-f69.google.com with SMTP id
 g4-20020adfbc84000000b0022fc417f87cso2252787wrh.12
 for <qemu-trivial@nongnu.org>; Sun, 30 Oct 2022 09:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XiSgRn3OF3vBbLkXmrF8qjKf9TlcfaSBGLDjFGgcnaE=;
 b=AmtWLoOay11oSmlp5bqgJs/lqhXg6bgStHVVwT+is9YC/yfgD11U5k1STfUhnbZp0o
 kpiF+86d/eknFqrvg9LPjO3mL74hpH83TxTfaVZ1sOwQY5RqpFOhKQvajAnJOgib/zVV
 T6w+PnnEwAyKms5656PJtm72cN1jDPcbpf4CVjAaCL4E19am+002dTmhdSuLRq9GBd1G
 +sk6mH86IprDWfak98AB+er1aPEXAau+9ZsdPl1ndZCeOYmylRvYzLd5cGR4h6gZIUeo
 LEN1JWZ+WV/UybCGdSBD4EuityyVIRuAFnO3bPFb2J0aNhviStjFrQxo+Z1ka7u/Sqo+
 KCnA==
X-Gm-Message-State: ACrzQf25SdcTJs8D2EWOHscdsPXRXdwqUL1oqaohSL0NgkSVwSgTxJDj
 SBUOiFIzn5WpPQz/MABAbuwL3bzyj1n9h0N7fZpgk15EYZHOwCFjww1LVOpw1oQZRTyx1slcbCm
 8+yjCqO6Ff6m+DCxEPg==
X-Received: by 2002:a5d:4804:0:b0:236:94d4:5472 with SMTP id
 l4-20020a5d4804000000b0023694d45472mr5440541wrq.286.1667147438447; 
 Sun, 30 Oct 2022 09:30:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7MUXbVQVSxvvIW35nVi+pBQtIT5eCevpeIA5+PIGYZpvsbvNgiitGDINEAasTUoUvoW+YKjQ==
X-Received: by 2002:a5d:4804:0:b0:236:94d4:5472 with SMTP id
 l4-20020a5d4804000000b0023694d45472mr5440527wrq.286.1667147438174; 
 Sun, 30 Oct 2022 09:30:38 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 y9-20020adffa49000000b002345cb2723esm4552789wrr.17.2022.10.30.09.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 09:30:37 -0700 (PDT)
Date: Sun, 30 Oct 2022 12:30:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: B <shentey@gmail.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 3/3] hw/i386/acpi-build: Resolve north rather than
 south bridges
Message-ID: <20221030123026-mutt-send-email-mst@kernel.org>
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-4-shentey@gmail.com>
 <CAARzgwyMiEQUc=DEd5iJb=hgsoMn8tQaNeOnzKAG8qaxWhdRYw@mail.gmail.com>
 <8EA83461-41EC-40E1-AD22-C4107216870B@gmail.com>
 <CAARzgwyRJbQuUFBOSsnm_PHLWoOBcKYX8WucKk7_VeQ=Xan0kg@mail.gmail.com>
 <20221029043803-mutt-send-email-mst@kernel.org>
 <fe7a1bbb-9993-4eee-6543-5e7e8391b6c@anisinha.ca>
 <20221030121158-mutt-send-email-mst@kernel.org>
 <1ef31b1-edac-cda8-4560-f633c63a9244@anisinha.ca>
MIME-Version: 1.0
In-Reply-To: <1ef31b1-edac-cda8-4560-f633c63a9244@anisinha.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 30 Oct 2022 16:30:46 -0000

On Sun, Oct 30, 2022 at 09:48:08PM +0530, Ani Sinha wrote:
> 
> 
> On Sun, 30 Oct 2022, Michael S. Tsirkin wrote:
> 
> > On Sun, Oct 30, 2022 at 09:15:44PM +0530, Ani Sinha wrote:
> > >
> > >
> > > On Sat, 29 Oct 2022, Michael S. Tsirkin wrote:
> > >
> > > > On Fri, Oct 28, 2022 at 10:18:43PM +0530, Ani Sinha wrote:
> > > > > On Fri, Oct 28, 2022 at 9:45 PM B <shentey@gmail.com> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > Am 28. Oktober 2022 10:58:07 UTC schrieb Ani Sinha <ani@anisinha.ca>:
> > > > > > >On Fri, Oct 28, 2022 at 4:05 PM Bernhard Beschow <shentey@gmail.com> wrote:
> > > > > > >>
> > > > > > >> The code currently assumes Q35 iff ICH9 and i440fx iff PIIX. Now that more
> > > > > > >> AML generation has been moved into the south bridges and since the
> > > > > > >> machines define themselves primarily through their north bridges, let's
> > > > > > >> switch to resolving the north bridges for AML generation instead. This
> > > > > > >> also allows for easier experimentation with different south bridges in
> > > > > > >> the "pc" machine, e.g. with PIIX4 and VT82xx.
> > > > > > >
> > > > > > >Unfortunately this patch does not apply on the latest master. Also the
> > > > > > >code seems to be off. Can you rebase and rework the patch?
> > > > > >
> > > > > > I've rebased onto Igor's series to avoid merge conflicts,
> > > > >
> > > > > Ok I will let Igor deal with this then since I have not followed his patchset.
> > > >
> > > > should you want to review this, it's all in my tree right now.
> > >
> > > I tried your "next" branch from
> > > git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git
> > >
> > > and it does not apply there either.
> >
> >
> > commit 87bbbe87c259414864a02e8385a0c8becd269ea5
> > It is already applied there.
> 
> Hmm, I am not seeing it :
> 
> ani@ani-ubuntu:~/workspace/qemu-mst$ git show
> 87bbbe87c259414864a02e8385a0c8becd269ea5
> fatal: bad object 87bbbe87c259414864a02e8385a0c8becd269ea5
> ani@ani-ubuntu:~/workspace/qemu-mst$ git branch -vv
>   master 7457fe9541 [origin/master] Update version for v1.7.0-rc2 release
> * next   e336a0d550 [origin/next] ack! hw/ide/piix: Ignore writes of hardwired PCI command register bits

oh right. pushed now.


