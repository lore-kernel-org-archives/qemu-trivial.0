Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aj3Ox-00074k-RC
	for mharc-qemu-trivial@gnu.org; Thu, 24 Mar 2016 07:26:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aj3Ov-0006zb-4K
	for qemu-trivial@nongnu.org; Thu, 24 Mar 2016 07:26:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aj3Or-0001Tb-5F
	for qemu-trivial@nongnu.org; Thu, 24 Mar 2016 07:26:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38564)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1aj3Ol-0001T7-Ea; Thu, 24 Mar 2016 07:25:55 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id F17038F4EC;
	Thu, 24 Mar 2016 11:25:54 +0000 (UTC)
Received: from [10.36.112.25] (ovpn-112-25.ams2.redhat.com [10.36.112.25])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2OBPoAk027029
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 24 Mar 2016 07:25:52 -0400
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1458814461-5387-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56F3CEBE.7060002@redhat.com>
Date: Thu, 24 Mar 2016 12:25:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458814461-5387-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, eblake@redhat.com,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] qdev property: cleanup
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Mar 2016 11:26:06 -0000



On 24/03/2016 11:14, Cao jin wrote:
> include:
> 1. remove unnecessary declaration of static function
> 2. fix inconsistency between comment and function name, and typo OOM->QOM
> 2. update comment of function
> 
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
> A question about legacy property: I don`t see legacy property is really
> used in the code, so, why still add legacy property to object?

It's used here:

static void qdev_print_props(Monitor *mon, DeviceState *dev, Property *props,
                             int indent)
{
    if (!props)
        return;
    for (; props->name; props++) {
        Error *err = NULL;
        char *value;
        char *legacy_name = g_strdup_printf("legacy-%s", props->name);
        if (object_property_get_type(OBJECT(dev), legacy_name, NULL)) {
            value = object_property_get_str(OBJECT(dev), legacy_name, &err);
        } else {
            value = object_property_print(OBJECT(dev), props->name, true, &err);
        }
        g_free(legacy_name);

        if (err) {
            error_free(err);
            continue;
        }
        qdev_printf("%s = %s\n", props->name,
                    value && *value ? value : "<null>");
        g_free(value);
    }
}

Paolo

