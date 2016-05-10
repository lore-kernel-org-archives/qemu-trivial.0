Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b079x-0005OV-0Y
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 08:53:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1b079t-0005GU-Dm
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 08:53:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1b079n-0005mW-Np
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 08:53:04 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:33005)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1b079n-0005lG-E8; Tue, 10 May 2016 08:52:59 -0400
Received: by mail-wm0-x244.google.com with SMTP id r12so2527875wme.0;
	Tue, 10 May 2016 05:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=kN9mCEYLzagXcZV9yxkXmdKNWr/om7MCvgssfpXSGEI=;
	b=aA75RhD72nJLbm9smWl/U2jhdipV++XO2bsV6nYlhIEhqvogBG7YWR+aANgNSEpAnZ
	E436FGkU8o7g0mPmtaKi4OcGE2By3Q+f4tco4yqSSEz50tJpKXAS6d3H/JltCSeLmb6p
	IQkWZEYKoncpTEbSyuN0aD9ToKpX9cmjwhlOoM03/cS9Gc1y1AteH7Syy/qBIjRcMwbe
	ykoB/cSF+ycav+QxNZEakNYmBVGYEs0sgen5vymlSYIx2qv1de0Jxa/lEfCYuxY6XGLW
	Na+b0XrM1eUisLW8k3GnGnVPMW3gRJflc+PW7gSw/e1cAXmVIQTsWtQIhtjnDj5iHFLX
	9dAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=kN9mCEYLzagXcZV9yxkXmdKNWr/om7MCvgssfpXSGEI=;
	b=Ep+C0NyJA4YMiczqBbJhr3cNGru4Glg7DSX0+H7HuxvfoE3sM1rIpijXIKP4yWhf89
	IViNkTkzfYWyYFC+xiX4yjKXgOU0H/8SaPL58SSy8Ob2kAGYcIhMq48vA0vu2AwQfFFv
	ac4zLqn9KUayLQW73uOQpZd2bLdFrR+cJx+Xrbv/q80lty98i2AjgV6CBXweU2imByHL
	bq2RXuJVBn2nh1slxc4I2hhepKAR3pyHW+TNQKwZuBSzDkYrooeBVUo5N9nNlc0bmgPy
	Y0rUAHkw62lhc7RVE9niUFeUaZaf3WFgRJ9TiAVmVFYSJJqZYDdo0tpK4SAYyvPqh9fT
	MnNQ==
X-Gm-Message-State: AOPr4FUXpuUEb7n8jp98m+LLYQLk0XSioJOEeGS4Rzm6XBmiHDVSKJkAy1DbBEl0mcpQ0g==
X-Received: by 10.28.189.130 with SMTP id n124mr15284674wmf.76.1462884777500; 
	Tue, 10 May 2016 05:52:57 -0700 (PDT)
Received: from [192.168.10.150] (dynamic-adsl-78-12-252-58.clienti.tiscali.it.
	[78.12.252.58]) by smtp.googlemail.com with ESMTPSA id
	f11sm30279572wmf.22.2016.05.10.05.52.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2016 05:52:56 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1460879154-13258-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Cc: armbru@redhat.com, peter.maydell@linaro.org, qemu-trivial@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5731D9A7.4030300@redhat.com>
Date: Tue, 10 May 2016 14:52:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <1460879154-13258-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [PATCH v2] qdev: Clean up around properties
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2016 12:53:07 -0000

Just comments, so

Cc: qemu-trivial@nongnu.org

On 17/04/2016 09:45, Cao jin wrote:
> include:
> 1. remove unnecessary declaration of static function
> 2. fix inconsistency between comment and function name, and typo OOM->QOM
> 2. update comments of functions, use uniform format(GTK-Doc style)
> 
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
> changelog:
> 1. Use uniform comment format. (Markus)
> 2. Update function comments. (Markus & Paolo)
> 
> comments of qdev_add_legacy_property maybe need polishing, Maintainer who will
> take this patch can touch that comment directly:)
> 
>  hw/core/qdev.c               | 30 +++++++++++++++++++-----------
>  include/hw/qdev-properties.h | 10 ++++++++--
>  2 files changed, 27 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index db41aa1..204f77b 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -58,9 +58,6 @@ const char *qdev_fw_name(DeviceState *dev)
>      return object_get_typename(OBJECT(dev));
>  }
>  
> -static void qdev_property_add_legacy(DeviceState *dev, Property *prop,
> -                                     Error **errp);
> -
>  static void bus_remove_child(BusState *bus, DeviceState *child)
>  {
>      BusChild *kid;
> @@ -908,13 +905,20 @@ static void qdev_get_legacy_property(Object *obj, Visitor *v,
>  }
>  
>  /**
> - * @qdev_add_legacy_property - adds a legacy property
> + * qdev_property_add_legacy:
> + * @dev: Device to add the property to.
> + * @prop: The qdev property definition.
> + * @errp: location to store error information.
> + *
> + * Add a legacy QOM property to @dev for qdev property @prop.
> + * On error, store error in @errp.
>   *
> - * Do not use this is new code!  Properties added through this interface will
> - * be given names and types in the "legacy" namespace.
> + * Legacy properties are string versions of QOM properties.  The format of
> + * the string depends on the property type.  Legacy properties are only
> + * needed for "info qtree".
>   *
> - * Legacy properties are string versions of other OOM properties.  The format
> - * of the string depends on the property type.
> + * Do not use this is new code!  QOM Properties added through this interface
> + * will be given names in the "legacy" namespace.
>   */
>  static void qdev_property_add_legacy(DeviceState *dev, Property *prop,
>                                       Error **errp)
> @@ -937,10 +941,14 @@ static void qdev_property_add_legacy(DeviceState *dev, Property *prop,
>  }
>  
>  /**
> - * @qdev_property_add_static - add a @Property to a device.
> + * qdev_property_add_static:
> + * @dev: Device to add the property to.
> + * @prop: The qdev property definition.
> + * @errp: location to store error information.
>   *
> - * Static properties access data in a struct.  The actual type of the
> - * property and the field depends on the property type.
> + * Add a static QOM property to @dev for qdev property @prop.
> + * On error, store error in @errp.  Static properties access data in a struct.
> + * The type of the QOM property is derived from prop->info.
>   */
>  void qdev_property_add_static(DeviceState *dev, Property *prop,
>                                Error **errp)
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 0586cac..034b75a 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -197,8 +197,14 @@ void error_set_from_qdev_prop_error(Error **errp, int ret, DeviceState *dev,
>                                      Property *prop, const char *value);
>  
>  /**
> - * @qdev_property_add_static - add a @Property to a device referencing a
> - * field in a struct.
> + * qdev_property_add_static:
> + * @dev: Device to add the property to.
> + * @prop: The qdev property definition.
> + * @errp: location to store error information.
> + *
> + * Add a static QOM property to @dev for qdev property @prop.
> + * On error, store error in @errp.  Static properties access data in a struct.
> + * The type of the QOM property is derived from prop->info.
>   */
>  void qdev_property_add_static(DeviceState *dev, Property *prop, Error **errp);
>  
> 

