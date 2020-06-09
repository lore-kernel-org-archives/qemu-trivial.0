Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiiFr-0000ky-EB
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jun 2020 13:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jiiFp-0000hU-Te
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2020 13:41:41 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32185
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jiiFo-0005ZB-9z
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2020 13:41:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591724498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ihmIiostKvdpw1r9iZpPNAlh9WuRRNQ2zRGcXyc1pUY=;
 b=CXfe1kzVNQEtVZzoN4N23F9JlTVwgkV/lspdTNXXmxC4YyyVsxhkgjZzUW37smLEh5fGuV
 wDbQP5IB8nLx4Q/vwxLSEzdUpMPGa9dnkf7nI2Q1jLvWWYO3J80o9ThUjoodsrWUlNLq8m
 jb6/6rYs7APzI2U36cISo6rX2jt0p0k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-vBPeENf4PuWqC-a3RwgyzQ-1; Tue, 09 Jun 2020 13:41:34 -0400
X-MC-Unique: vBPeENf4PuWqC-a3RwgyzQ-1
Received: by mail-wm1-f69.google.com with SMTP id s15so910843wmc.8
 for <qemu-trivial@nongnu.org>; Tue, 09 Jun 2020 10:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AJKtT4l2MFAMGi/3mhANHfLaqRqaP5VrhgmxxaiqQUc=;
 b=Hrz5B5fDxGYNNr5OAtuQmN7IowuZdxBK4ljCueGI9AwuZtH8Ic3szF0FgOdqgu+XoB
 6ZQk68mWidXAQHabUhkIfodIXuFIZK8AqsYs6uJNEmXuehN7UmUVJ6nSfe7eG25I3NzY
 UbcZkVARmCs+fokCu6R/DMSmkqBxHeWyCsEMC2It0rJbLfQUHSAOOX9JMLAW1KUQlqiV
 kB6SNk3k1BsoGa0tjSx4b5Mw43y0jtm8b/9+btScYLS9vIM1nt6uwqbc0bu8fNruHWWT
 O247SUh8rSHYwQTYkLRSr+mI8bb9BdzGYsUCUsoWYriqSt34JRpyJZSWmzVOrJVKy2Yy
 vvMg==
X-Gm-Message-State: AOAM530mlVgY3vb1oXKYCDb1TL2xvELf9VhPNpK53qZEKd25gqr7s/7W
 NWW5246EeCtOjjIPCnH2WP8K9MfvfaVck9+WSkT4UXnHSd60gWHLl/5A/e/osuszCYGWWTPsCoa
 XYBwwnSQ6T+F8vFGVmw==
X-Received: by 2002:a5d:4b85:: with SMTP id b5mr5633317wrt.8.1591724493371;
 Tue, 09 Jun 2020 10:41:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyA56wFHTMub+p3FUiWNMRz2BM3jk3/EdANFyGcNswBCWfj2x4I/lpz0sI5Zl+JVnjqZtW77Q==
X-Received: by 2002:a5d:4b85:: with SMTP id b5mr5633298wrt.8.1591724493084;
 Tue, 09 Jun 2020 10:41:33 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id q128sm3660535wma.38.2020.06.09.10.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 10:41:32 -0700 (PDT)
Date: Tue, 9 Jun 2020 13:41:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] hw/pci: Fix crash when running QEMU with "-nic
 model=rocker"
Message-ID: <20200609134118-mutt-send-email-mst@kernel.org>
References: <20200527153152.9211-1-thuth@redhat.com>
 <bead355e-de7f-e584-53a7-34b2f1664be4@vivier.eu>
 <7e862bc4-0d5d-298e-0d1b-b8249100da9c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7e862bc4-0d5d-298e-0d1b-b8249100da9c@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 23:42:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 09 Jun 2020 17:41:42 -0000

On Tue, Jun 09, 2020 at 07:24:24PM +0200, Paolo Bonzini wrote:
> On 09/06/20 19:21, Laurent Vivier wrote:
> > Le 27/05/2020 à 17:31, Thomas Huth a écrit :
> >> QEMU currently aborts when being started with "-nic model=rocker" or with
> >> "-net nic,model=rocker". This happens because the "rocker" device is not
> >> a normal NIC but a switch, which has different properties. Thus we should
> >> only consider real NIC devices for "-nic" and "-net". These devices can
> >> be identified by the "netdev" property, so check for this property before
> >> adding the device to the list.
> >>
> >> Reported-by: Michael Tokarev <mjt@tls.msk.ru>
> >> Fixes: 52310c3fa7dc854d ("net: allow using any PCI NICs in -net or -nic")
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>  hw/pci/pci.c | 13 ++++++++++++-
> >>  1 file changed, 12 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> >> index 70c66965f5..46214f8287 100644
> >> --- a/hw/pci/pci.c
> >> +++ b/hw/pci/pci.c
> >> @@ -1887,7 +1887,18 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
> >>          if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
> >>              dc->user_creatable) {
> >>              const char *name = object_class_get_name(list->data);
> >> -            g_ptr_array_add(pci_nic_models, (gpointer)name);
> >> +            /*
> >> +             * A network device might also be something else than a NIC, see
> >> +             * e.g. the "rocker" device. Thus we have to look for the "netdev"
> >> +             * property, too. Unfortunately, some devices like virtio-net only
> >> +             * create this property during instance_init, so we have to create
> >> +             * a temporary instance here to be able to check it.
> >> +             */
> >> +            Object *obj = object_new_with_class(OBJECT_CLASS(dc));
> >> +            if (object_property_find(obj, "netdev", NULL)) {
> >> +                g_ptr_array_add(pci_nic_models, (gpointer)name);
> >> +            }
> >> +            object_unref(obj);
> >>          }
> >>          next = list->next;
> >>          g_slist_free_1(list);
> >>
> > 
> > Not really trivial, I will not pick up this patch via trivial-branch,
> > unless PCI maintainers request it.
> > 
> > Thanks,
> > Laurent
> > 
> 
> I'll pick it up then.
> 
> Paolo

I queued this already. Thanks!

-- 
MST


