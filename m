Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qKOec-0006Ih-SM
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2023 15:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qKOeZ-0006Hr-Ua
 for qemu-trivial@nongnu.org; Fri, 14 Jul 2023 15:40:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qKOeX-0004mY-30
 for qemu-trivial@nongnu.org; Fri, 14 Jul 2023 15:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689363632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e7JAsij8hB3O4SojcpxmQF1nnT8HBylZgOPyDV1M1d8=;
 b=YPCvlTBgsZpxU9JkRO8ROQaF08RMVywwbs41iOQTylCVT+7suYG+0ejOuxRr2VeSUtzn0e
 GogEwNsjOukR41OOhFdKzjUu56QYdTvQt3xJXlOvOkbPeXRfflKFczeShQPQ8+QCem2Vgu
 r6IOsS+88koD73AZvgX2fkcKJ4BNy9k=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-harCktk3PH-cQvGb2FaY3A-1; Fri, 14 Jul 2023 15:40:30 -0400
X-MC-Unique: harCktk3PH-cQvGb2FaY3A-1
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-786d9d4d9a6so97164339f.2
 for <qemu-trivial@nongnu.org>; Fri, 14 Jul 2023 12:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689363629; x=1691955629;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e7JAsij8hB3O4SojcpxmQF1nnT8HBylZgOPyDV1M1d8=;
 b=gleCKxDByL02fAAHrcyro/55H0m+KVfqJApOsjUX5FqgnkNjotw/Ku19Q7ufuN+WjD
 56iaH/WyA6ljSqNeX8equ9h0f8XPf5v3DAFPA9NJSYRJ6S0kOvo6z7MQMHdnV0v5LZMj
 1978y1hDu9pF4sDtJWWeX9u8NnFqcXpoFyaIBh9wJYijFe4EtmcI2rzs8QwqlQUvvqGh
 P6fP0LonxUvqKyh1EyA6LeoZaLTedGW8vEBXNykHPQKqb8VLDSUBebDvGRjeoSRny56y
 eTbhRnZfiLP3iF6D46R1uPbYbXjAJ0VGKrIgH0g8MXXiWKPy7ayP4/3yUCjm8y0q7HkT
 I5CQ==
X-Gm-Message-State: ABy/qLYGfezQ9U0VaDXMVaKl1lXNfPmzW6Z+6+PY0kld1j9mDNsF9P7E
 cefHGruuBsNcJGy7lUFZwPmOlsS3tuUhO7bOtcvB2bYSZzptB4qbLto73x2cgds3qC9Tk6aj6kO
 CUq4eIz5FeQzhYXWT5w==
X-Received: by 2002:a6b:e80c:0:b0:780:d031:bc42 with SMTP id
 f12-20020a6be80c000000b00780d031bc42mr6548445ioh.16.1689363629815; 
 Fri, 14 Jul 2023 12:40:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlENeThG68pvLNBRaQXdpWrlPn8xq7CUuk4Byx+pCFvwFw5ClDk0hz+RgDh6cD6+MwEd9QdnTQ==
X-Received: by 2002:a6b:e80c:0:b0:780:d031:bc42 with SMTP id
 f12-20020a6be80c000000b00780d031bc42mr6548416ioh.16.1689363629575; 
 Fri, 14 Jul 2023 12:40:29 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 x3-20020a6bfe03000000b0077e40979b41sm2836306ioh.45.2023.07.14.12.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 12:40:29 -0700 (PDT)
Date: Fri, 14 Jul 2023 13:40:28 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] treewide: spelling fixes in comments and some strings
Message-ID: <20230714134028.2c987970.alex.williamson@redhat.com>
In-Reply-To: <849f5b3a-33cd-3406-4462-90ac11bcde96@tls.msk.ru>
References: <20230714113834.1186117-1-mjt@tls.msk.ru>
 <20230714113834.1186117-3-mjt@tls.msk.ru>
 <20230714122201.3b118f40.alex.williamson@redhat.com>
 <849f5b3a-33cd-3406-4462-90ac11bcde96@tls.msk.ru>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 14 Jul 2023 19:40:36 -0000

On Fri, 14 Jul 2023 21:50:01 +0300
Michael Tokarev <mjt@tls.msk.ru> wrote:

> 14.07.2023 21:22, Alex Williamson wrote:
> > On Fri, 14 Jul 2023 14:38:06 +0300
> > Michael Tokarev <mjt@tls.msk.ru> wrote:
> >   
> >> diff --git a/hw/ppc/spapr_pci_vfio.c b/hw/ppc/spapr_pci_vfio.c
> >> index d8aeee0b7e..12e7790cf6 100644
> >> --- a/hw/ppc/spapr_pci_vfio.c
> >> +++ b/hw/ppc/spapr_pci_vfio.c
> >> @@ -39,7 +39,7 @@ static void spapr_phb_vfio_eeh_reenable(SpaprPhbState *sphb)
> >>   void spapr_phb_vfio_reset(DeviceState *qdev)
> >>   {
> >>       /*
> >> -     * The PE might be in frozen state. To reenable the EEH
> >> +     * The PE might be in frozen state. To re-enable the EEH
> >>        * functionality on it will clean the frozen state, which
> >>        * ensures that the contained PCI devices will work properly
> >>        * after reboot.  
> > 
> > This looks like personal preference, I can't actually find a source
> > that indicates "reenable" is anything other than a valid alternative of
> > "re-enable".  Thanks,  
> 
> Well, it was one of the questionable suggestions from codespell.  I like
> the re-enable better but in this case I don't really care for one way or
> another. I can drop this and other similar fixes. This one definitely
> does not hurt my eyes when I see it ;)
> 
> $ git diff qemu-master..spelling | grep -c re-enable
> 8
> 
> I can drop those 8 out of 400 :)

If we consider codespell to be the authority I guess we can leave it,
but it seems a bit pedantic to me.  Thanks,

Alex


