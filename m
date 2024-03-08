Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ridE6-0001D5-Q1
	for mharc-qemu-trivial@gnu.org; Fri, 08 Mar 2024 11:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@cloud.com>)
 id 1ric7c-00087O-K2
 for qemu-trivial@nongnu.org; Fri, 08 Mar 2024 10:26:56 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anthony.perard@cloud.com>)
 id 1ric7a-0007Fe-TK
 for qemu-trivial@nongnu.org; Fri, 08 Mar 2024 10:26:56 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a45606c8444so284382966b.3
 for <qemu-trivial@nongnu.org>; Fri, 08 Mar 2024 07:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.com; s=cloud; t=1709911611; x=1710516411; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e6fF84qOgCfbCnvQXCr7ZNpbBHM03v5U9YhZ2Fgrw8A=;
 b=BqeWc9WkM9ui660xWYbLOjgqdqEodbzxMRgjW6pB4EyUUGpdxiyZokVk7OCfElUryw
 QfB3o9U4ziP26h4Z4tGPIYTBpmO+jyhdkvomUeKCn7IJzc+dQwjhHRZvU/+ldst1bEze
 r1CqXBrBd84iM3FLUwXjxIEq65uckoDU2EaFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709911611; x=1710516411;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e6fF84qOgCfbCnvQXCr7ZNpbBHM03v5U9YhZ2Fgrw8A=;
 b=eRLOmNqz5IYrBi0DD4BDKAVig6oDen8F35vNhU1VarvBlgxp2aM9MfcbGsk+TncDQR
 9lqyHOjRhIKLbS4KaFRo1165PbmV8eynwyWdRKLYBCCEaVm43sPSIu+OIlJvUHBtfT9p
 pSDs3Mz8OoNRe9P7NQMDb9OH1oImzrUxfxfQNTLj4Q+sK6RZ53slslLwQyLHlg6AT58X
 G/4ruUwVbeVUo5LHJteyE8Ld8dDA3I3Z4pWpimsQwkH0wmOsl4riWi3R4Migfvt4HbQF
 9xvMMNK2OXVARaE03+BeGRfwQv1bmUOAKIuxG+bVVG9cAxKnx0hvu2CwKP3IWXxAn/nP
 10Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj0FFHpMTEnn0jlwIpt1eXJz634ehj14X3CgzNSfQPSIZNn5vqWAgBm2/YjKkot+XPVEnFq22c4t1H5YnRjHDW+G0bNxe5ww==
X-Gm-Message-State: AOJu0Ywe/y0p7Yn/EzvtonaUZ4R/pbResaTWIRPBZRkU4AojP+xPdwOZ
 ohie2GyARCLiSCuaU1+1ES8VmfOMbzHKgyfvQQV9Ebo8tliHnxmuBT3cVlW+mQg=
X-Google-Smtp-Source: AGHT+IF8bpS/Lw7LZTkiFNoNorWDHb16BGAHMIBNBfb5gg03OYucnJeZMZZLnORdZk+jn66CYtXHuw==
X-Received: by 2002:a17:907:100a:b0:a3e:b869:11b3 with SMTP id
 ox10-20020a170907100a00b00a3eb86911b3mr14901522ejb.55.1709911611379; 
 Fri, 08 Mar 2024 07:26:51 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 af1-20020a170906998100b00a45aa7cb029sm3914977ejc.36.2024.03.08.07.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 07:26:51 -0800 (PST)
Date: Fri, 8 Mar 2024 15:26:50 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Zhao Liu <zhao1.liu@linux.intel.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 02/17] hw/net/xen_nic: Fix missing ERRP_GUARD() for
 error_prepend()
Message-ID: <eb9066fd-e332-41f4-a234-4ddcaed9564c@perard>
References: <20240229143914.1977550-1-zhao1.liu@linux.intel.com>
 <20240229143914.1977550-3-zhao1.liu@linux.intel.com>
 <b353cdec-2d6e-4ab6-bd4e-3e9cee5091a1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b353cdec-2d6e-4ab6-bd4e-3e9cee5091a1@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=anthony.perard@cloud.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 08 Mar 2024 11:37:34 -0500
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
X-List-Received-Date: Fri, 08 Mar 2024 15:26:56 -0000

On Thu, Feb 29, 2024 at 06:25:40PM +0100, Thomas Huth wrote:
> On 29/02/2024 15.38, Zhao Liu wrote:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > As the comment in qapi/error, passing @errp to error_prepend() requires
> > ERRP_GUARD():
> > 
> > * = Why, when and how to use ERRP_GUARD() =
> > *
> > * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> > ...
> > * - It should not be passed to error_prepend(), error_vprepend() or
> > *   error_append_hint(), because that doesn't work with &error_fatal.
> > * ERRP_GUARD() lifts these restrictions.
> > *
> > * To use ERRP_GUARD(), add it right at the beginning of the function.
> > * @errp can then be used without worrying about the argument being
> > * NULL or &error_fatal.
> > 
> > ERRP_GUARD() could avoid the case when @errp is the pointer of
> > error_fatal, the user can't see this additional information, because
> > exit() happens in error_setg earlier than information is added [1].
> > 
> > The xen_netdev_connect() passes @errp to error_prepend(), and its @errp
> > parameter is from xen_device_frontend_changed().
> > 
> > Though its @errp points to @local_err of xen_device_frontend_changed(),
> > to follow the requirement of @errp, add missing ERRP_GUARD() at the
> > beginning of this function.
> > 
> > [1]: Issue description in the commit message of commit ae7c80a7bd73
> >       ("error: New macro ERRP_GUARD()").
> > 
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Anthony Perard <anthony.perard@citrix.com>
> > Cc: Paul Durrant <paul@xen.org>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   hw/net/xen_nic.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
> > index 453fdb981983..89487b49baf9 100644
> > --- a/hw/net/xen_nic.c
> > +++ b/hw/net/xen_nic.c
> > @@ -351,6 +351,7 @@ static bool net_event(void *_xendev)
> >   static bool xen_netdev_connect(XenDevice *xendev, Error **errp)
> >   {
> > +    ERRP_GUARD();
> >       XenNetDev *netdev = XEN_NET_DEVICE(xendev);
> >       unsigned int port, rx_copy;
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

