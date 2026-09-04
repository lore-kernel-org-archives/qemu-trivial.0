Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E53C624D3
	for <qemu-trivial@archiver.kernel.org>; Fri,  4 Sep 2026 18:02:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1x2YFH-00026b-Qg; Fri, 04 Sep 2026 14:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1x2YFH-00026M-05
 for qemu-trivial@nongnu.org; Fri, 04 Sep 2026 14:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1x2YFE-0001HX-AN
 for qemu-trivial@nongnu.org; Fri, 04 Sep 2026 14:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788544951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xu7WipYE0vBrNVrbrQuBOrlI2YP7MfKt+pRTWpGeXu4=;
 b=Ui2aegJBa28WsDkCG3WeNTEZWhubNpe2giH7NRCSha905VR4kqwn3uy5KFP1In69WZXI3B
 5Ub6xitima15c+s9NJ6zJwD5uNFFuDghWgGZI3wySMv+QwhdCsdOxNaY5BEJ5kGXw04vQE
 uVMCf2CGTwXSfDn/DxtJX8GdVNsdpTc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-mHEYFttmNGmNU-OmPBTF7Q-1; Fri, 04 Sep 2026 14:02:27 -0400
X-MC-Unique: mHEYFttmNGmNU-OmPBTF7Q-1
X-Mimecast-MFC-AGG-ID: mHEYFttmNGmNU-OmPBTF7Q_1788544946
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-482e2541c30so902538f8f.1
 for <qemu-trivial@nongnu.org>; Fri, 04 Sep 2026 11:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788544946; x=1789149746;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xu7WipYE0vBrNVrbrQuBOrlI2YP7MfKt+pRTWpGeXu4=;
 b=rUY3QYNr4y22ZvgxZnMmWqeAqM0CWudv7GMqjeRx0VjhSJamtjoMPh1lrtZFxQKfqU
 itqSxz+qy6LgS8ml1R+ugVDhJJdaj9L1+We+xCGKZGoQ77Gnno9yba3W0XUyDa7JD1dz
 4jHfet5qr+VhUfIm/p5N8krX92iJ+gRrQptSWsq9LslQsdPvQECg77VvXhJp7ZyALqPY
 2DgrZatzel4tkPgdSTNLSvuFt+2gqdjIbr9iv9t+GQQKe2QcUB7kQE8PIvJRU4ukZo5z
 DXryISjvApCv+fzQw0JnkAcMYyFkdD6IPpZ0yBayev3LLCkiMCJIDeh9V9ff0SjsqKD5
 AUyQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzmvECX4J5wDAVPgn+4wYfPXEmO46un38zVXZHR8+3dIRw/chtBqOwADbkdGChVCZSCmzXavqnl43Bp+6g=@nongnu.org
X-Gm-Message-State: AFuF++ldzXB8wgUWiBOIIlGfXLSLlS1HkXcz4DFTJjSF3eNXFRksQX6a
 5jDZL8AyL7Tao5Xp9p2U4znc/4ryxDtUmrItGK8rOAYGxX8ffu1puZTFLG5F2eCi2gR0Mz2rp8Q
 ZCRnT0M5eljzyQMrhGsLbO8UYkHKLFpofhqSoGtcE4UK8VEvPmE5u26Abb0M=
X-Gm-Gg: AYBFou3WxeKxfnN8ra0F/Ds6D9aQtuS45zedJkCNb8AOPvQbpCmjwbkL9IBp30JnQj7
 Hi0DHfx7FwLI3aa0+mOPtqqr9HIYIb7XOtzSW1XvGmTHuSnBSw6K3xlXKuVAm4GJYvV9fZ20r3A
 1zTaw/JtawnV3Akc7KLZmy0lScpNxf18PHyg953DzA0L0cbw7otePRu94UM5OWZZ6/GNRpDh7zb
 ZyjjAf3HFqnj3Z+cHjPOZf1U4afWGcjBeZzdBxmp3JTpJKUdPweFaKjIjiyCpgBFA642gY/t18M
 hOtW3cJoEHyimKm8B45/SGLiT/CdhwV7gCnYS/9WpwxynQD4l0KTqx4U1qlZ7pSA+BmusFGSekn
 zRn4nlSWUaYdTKnE6d2k31jY=
X-Received: by 2002:a05:6000:455c:b0:485:8df2:6460 with SMTP id
 ffacd0b85a97d-4858df26482mr2844210f8f.20.1788544946059; 
 Fri, 04 Sep 2026 11:02:26 -0700 (PDT)
X-Received: by 2002:a05:6000:455c:b0:485:8df2:6460 with SMTP id
 ffacd0b85a97d-4858df26482mr2844138f8f.20.1788544945489; 
 Fri, 04 Sep 2026 11:02:25 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485881353e8sm8126195f8f.1.2026.09.04.11.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 11:02:24 -0700 (PDT)
Date: Fri, 4 Sep 2026 14:02:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Weimin Xiong <xiongwm2026@163.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, qemu-trivial@nongnu.org,
 Xiong Weimin <xiongweimin@kylinos.cn>
Subject: Re: [PATCH] net/tap-solaris: Fix resource leaks on error paths
Message-ID: <20260904135600-mutt-send-email-mst@kernel.org>
References: <20260724093809.810220-1-xiongwm2026@163.com>
MIME-Version: 1.0
In-Reply-To: <20260724093809.810220-1-xiongwm2026@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NnzzvDXg5oqT30ZrZh0FO2CSk3KRJcbGeCgaAEq5Mtk_1788544946
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Fri, Jul 24, 2026 at 05:38:09PM +0800, Weimin Xiong wrote:
> From: Xiong Weimin <xiongweimin@kylinos.cn>
> 
> The tap_alloc() function has multiple error paths where opened file
> descriptors (tap_fd, if_fd, ip_fd) are not closed before returning
> error. This leads to resource leaks.
> 
> Fix this by properly closing file descriptors before returning error
> in all error paths.
> 
> Signed-off-by: Xiong Weimin <xiongweimin@kylinos.cn>
> ---
>  net/tap-solaris.c | 47 +++++++++++++++++++++++++++++++++++----------
>  1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/net/tap-solaris.c b/net/tap-solaris.c
> index 1234567890ab..fedcba098765 4321006

mode 4321006? this line seems corrupt, at least it confuses my git am


> --- a/net/tap-solaris.c
> +++ b/net/tap-solaris.c
> @@ -60,8 +60,6 @@
>   */
>  static int tap_alloc(char *dev, size_t dev_size, Error **errp)
>  {
> -    /* FIXME leaks like a sieve on error paths */
> -    /* FIXME suspicious: many errors are reported, then ignored */
>      int tap_fd, if_fd, ppa = -1;
>      static int ip_fd = 0;
>      char *ptr;
> @@ -102,18 +100,30 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
>      strioc_ppa.ic_dp = (char *)&ppa;
>      if ((ppa = ioctl (tap_fd, I_STR, &strioc_ppa)) < 0) {
>          error_report("Can't assign new interface");
> -        return -1;
> +        goto fail_tap_fd;
>      }
>  
>      if_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
>      if (if_fd < 0) {
>          error_setg_file_open(errp, errno, "/dev/tap");
> -        return -1;
> +        goto fail_tap_fd;
>      }
>      if(ioctl(if_fd, I_PUSH, "ip") < 0){
>          error_setg(errp, "Can't push IP module");
> -        return -1;
> +        goto fail_if_fd;
> +    }
> +
> +    if (ioctl(if_fd, SIOCGLIFFLAGS, &ifr) < 0) {
> +        error_report("Can't get flags");
> +        goto fail_if_fd;
> +    }
> +
> +    snprintf(actual_name, 32, "tap%d", ppa);
> +    pstrcpy(ifr.lifr_name, sizeof(ifr.lifr_name), actual_name);
> +
> +    ifr.lifr_ppa = ppa;
> +    if (ioctl(if_fd, SIOCSLIFNAME, &ifr) < 0) {
> +        error_report("Can't set PPA %d", ppa);
> +        goto fail_if_fd;
>      }
>  
> -    if (ioctl(if_fd, SIOCGLIFFLAGS, &ifr) < 0)
> -        error_report("Can't get flags");
> +    if (ioctl(if_fd, SIOCGLIFFLAGS, &ifr) < 0) {
> +        error_report("Can't get flags");
> +        goto fail_if_fd;
> +    }
>  
> -    snprintf (actual_name, 32, "tap%d", ppa);
> -    pstrcpy(ifr.lifr_name, sizeof(ifr.lifr_name), actual_name);
> -
> -    ifr.lifr_ppa = ppa;
> -    /* Assign ppa according to the unit number returned by tun device */
> -
> -    if (ioctl (if_fd, SIOCSLIFNAME, &ifr) < 0)
> -        error_report("Can't set PPA %d", ppa);
> -    if (ioctl(if_fd, SIOCGLIFFLAGS, &ifr) <0)
> -        error_report("Can't get flags");
>      /* Push arp module to if_fd */
> -    if (ioctl (if_fd, I_PUSH, "arp") < 0)
> +    if (ioctl(if_fd, I_PUSH, "arp") < 0) {
>          error_report("Can't push ARP module (2)");
> +        goto fail_if_fd;
> +    }
>  
>      /* Push arp module to ip_fd */
> -    if (ioctl (ip_fd, I_POP, NULL) < 0)
> +    if (ioctl(ip_fd, I_POP, NULL) < 0) {
>          error_report("I_POP failed");
> -    if (ioctl (ip_fd, I_PUSH, "arp") < 0)
> +        goto fail_if_fd;
> +    }
> +    if (ioctl(ip_fd, I_PUSH, "arp") < 0) {
>          error_report("Can't push ARP module (3)");
> +        goto fail_if_fd;
> +    }
>      /* Open arp_fd */
>      arp_fd = RETRY_ON_EINTR(open("/dev/tap", O_RDWR, 0));
> -    if (arp_fd < 0)
> +    if (arp_fd < 0) {
>          error_report("Can't open %s", "/dev/tap");
> +        goto fail_if_fd;
> +    }
>  
>      /* Set ifname to arp */
>      strioc_if.ic_cmd = SIOCSLIFNAME;
> @@ -147,21 +172,37 @@ static int tap_alloc(char *dev, size_t dev_size, Error **errp)
>      strioc_if.ic_dp = (char *)&ifr;
>      if (ioctl(arp_fd, I_STR, &strioc_if) < 0){
>          error_report("Can't set ifname to arp");
> +        goto fail_arp_fd;
>      }
>  
>      if((ip_muxid = ioctl(ip_fd, I_LINK, if_fd)) < 0){
>          error_setg(errp, "Can't link TAP device to IP");
> -        return -1;
> +        goto fail_arp_fd;
>      }
>  
> -    if ((arp_muxid = ioctl (ip_fd, link_type, arp_fd)) < 0)
> +    if ((arp_muxid = ioctl(ip_fd, link_type, arp_fd)) < 0) {
>          error_report("Can't link TAP device to ARP");
> +        goto fail_ip_muxid;
> +    }
>  
>      close (if_fd);
> +    close(ip_fd);


so you close ip_fd here ...

>  
>      memset(&ifr, 0x0, sizeof(ifr));
>      pstrcpy(ifr.lifr_name, sizeof(ifr.lifr_name), actual_name);
>      ifr.lifr_ip_muxid  = ip_muxid;
>      ifr.lifr_arp_muxid = arp_muxid;
>  
> -    if (ioctl (ip_fd, SIOCSLIFMUXID, &ifr) < 0)
> -    {
> -      ioctl (ip_fd, I_PUNLINK , arp_muxid);
> -      ioctl (ip_fd, I_PUNLINK, ip_muxid);
> -      error_report("Can't set multiplexor id");
> +    if (ioctl(ip_fd, SIOCSLIFMUXID, &ifr) < 0) {


and then try to do an ioctl on it?

> +        ioctl(ip_fd, I_PUNLINK, arp_muxid);
> +        ioctl(ip_fd, I_PUNLINK, ip_muxid);
> +        error_report("Can't set multiplexor id");
> +        goto fail_arp_muxid;
>      }
>  
>      snprintf(dev, dev_size, "tap%d", ppa);
>      return tap_fd;
> +
> +fail_arp_muxid:
> +    close(arp_fd);

arp_fd closed here

> +fail_ip_muxid:
> +    ioctl(ip_fd, I_PUNLINK, ip_muxid);
> +fail_arp_fd:
> +    close(arp_fd);

then again here

> +fail_if_fd:
> +    close(if_fd);
> +fail_tap_fd:
> +    close(tap_fd);
> +    if (ip_fd > 0) {
> +        close(ip_fd);
> +        ip_fd = 0;
> +    }
> +    return -1;
>  }


