Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TbY8I-00053e-GL
	for mharc-qemu-trivial@gnu.org; Thu, 22 Nov 2012 09:52:02 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TbY88-0004K3-3Z
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2012 09:51:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TbY7y-0007UA-US
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2012 09:51:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54909)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1TbY7n-0007ST-JN; Thu, 22 Nov 2012 09:51:31 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qAMEpU7x012486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 22 Nov 2012 09:51:30 -0500
Received: from blackfin.pond.sub.org (ovpn-116-33.ams2.redhat.com
	[10.36.116.33])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qAMEpToG029892; Thu, 22 Nov 2012 09:51:29 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id CAFA02009B; Thu, 22 Nov 2012 15:51:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alexander Graf <agraf@suse.de>
References: <1353593796-26823-1-git-send-email-armbru@redhat.com>
	<4ECE5034-B4C3-4608-BAED-D599EF287588@suse.de>
Date: Thu, 22 Nov 2012 15:51:28 +0100
In-Reply-To: <4ECE5034-B4C3-4608-BAED-D599EF287588@suse.de> (Alexander Graf's
	message of "Thu, 22 Nov 2012 15:21:38 +0100")
Message-ID: <87haohu1vz.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Clean up pci_drive_hot_add()'s use of
	BlockInterfaceType
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
X-List-Received-Date: Thu, 22 Nov 2012 14:52:00 -0000

Alexander Graf <agraf@suse.de> writes:

> On 22.11.2012, at 15:16, Markus Armbruster wrote:
>
>> pci_drive_hot_add() parameter type has the wrong type: int instead of
>> BlockInterfaceType.  It's actually redundant, so we can just drop it.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>> hw/device-hotplug.c | 11 ++++-------
>> hw/pci-hotplug.c    |  7 +++----
>> sysemu.h            |  3 +--
>> 3 files changed, 8 insertions(+), 13 deletions(-)
>> 
>> diff --git a/hw/device-hotplug.c b/hw/device-hotplug.c
>> index eec0fe3..6d9c080 100644
>> --- a/hw/device-hotplug.c
>> +++ b/hw/device-hotplug.c
>> @@ -49,18 +49,16 @@ DriveInfo *add_init_drive(const char *optstr)
>> }
>> 
>> #if !defined(TARGET_I386)
>> -int pci_drive_hot_add(Monitor *mon, const QDict *qdict,
>> -                      DriveInfo *dinfo, int type)
>> +int pci_drive_hot_add(Monitor *mon, const QDict *qdict, DriveInfo *dinfo)
>> {
>>     /* On non-x86 we don't do PCI hotplug */
>> -    monitor_printf(mon, "Can't hot-add drive to type %d\n", type);
>> +    monitor_printf(mon, "Can't hot-add drive to type %d\n", dinfo->type);
>
> Can't we expose names instead? I don't really want internal enum
> numbering be part of our external CLI interface :)

Fixing that would be nice, but it's outside this patch's scope.

